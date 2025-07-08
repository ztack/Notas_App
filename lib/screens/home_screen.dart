// screens/home_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import '../database/nota_crud.dart';
import '../models/nota.dart';
import '../widgets/add_note_button.dart';
import '../widgets/note_dialogs.dart';
import '../widgets/notes_list.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotaCRUD _notaCRUD = NotaCRUD();
  late Future<List<Nota>> futureNotas;
  List<Nota> filteredNotas = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    futureNotas = _notaCRUD.getNotas();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final data = await _notaCRUD.getNotas();
    setState(() {
      filteredNotas = data;
      futureNotas = Future.value(data);
    });
  }

  void _filterNotes(String query) async {
    final allNotes = await futureNotas;
    setState(() {
      searchQuery = query;
      filteredNotas = allNotes
          .where(
            (note) => note.titulo.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  void _addNote() async {
    final result = await showAddNoteDialog(context);
    if (result != null) {
      await _notaCRUD.insertNota(result);
      _loadNotes();
    }
  }

  void _editNote(Nota nota) async {
    final result = await showEditNoteDialog(context, nota);
    if (result != null) {
      await _notaCRUD.updateNota(result);
      _loadNotes();
    }
  }

  void _deleteNote(Nota nota) async {
    final confirmed = await showDeleteNoteDialog(context);
    if (confirmed) {
      await _notaCRUD.deleteNota(nota.id!);
      _loadNotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Notas'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Nota>>(
        future: futureNotas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: \${snapshot.error}"));
          } else {
            return Column(
              children: [
                SearchBarWidget(onChanged: _filterNotes),
                AddNoteButton(onPressed: _addNote),
                const Divider(height: 1),
                NotesList(
                  notas: filteredNotas,
                  onEdit: _editNote,
                  onDelete: _deleteNote,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
