// widgets/notes_list.dart

import 'package:flutter/material.dart';
import '../models/nota.dart';
import '../widgets/note_card.dart';

class NotesList extends StatelessWidget {
  final List<Nota> notas;
  final Function(Nota) onEdit;
  final Function(Nota) onDelete;

  const NotesList({
    super.key,
    required this.notas,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (notas.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'No se encontraron notas.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: notas.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final nota = notas[index];
          return NoteCard(
            nota: nota,
            onEdit: () => onEdit(nota),
            onDelete: () => onDelete(nota),
          );
        },
      ),
    );
  }
}
