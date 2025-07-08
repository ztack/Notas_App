import 'package:flutter/material.dart';
import '../models/nota.dart';

Future<Nota?> showAddNoteDialog(BuildContext context) async {
  String title = '';
  String content = '';

  return await showDialog<Nota>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Agregar Nota'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Título',
                  prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) => title = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contenido',
                  prefixIcon: const Icon(Icons.notes),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 5,
                onChanged: (value) => content = value,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context, null),
          ),
          ElevatedButton(
            onPressed: () {
              if (title.trim().isNotEmpty && content.trim().isNotEmpty) {
                Navigator.pop(
                  context,
                  Nota(titulo: title.trim(), contenido: content.trim()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Agregar'),
          ),
        ],
      );
    },
  );
}

Future<Nota?> showEditNoteDialog(BuildContext context, Nota nota) async {
  String title = nota.titulo;
  String content = nota.contenido;

  return await showDialog<Nota>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Editar Nota'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                initialValue: nota.titulo,
                decoration: InputDecoration(
                  labelText: 'Título',
                  prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) => title = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: nota.contenido,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Contenido',
                  prefixIcon: const Icon(Icons.notes),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) => content = value,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context, null),
          ),
          ElevatedButton(
            onPressed: () {
              if (title.trim().isNotEmpty && content.trim().isNotEmpty) {
                Navigator.pop(
                  context,
                  Nota(
                    id: nota.id,
                    titulo: title.trim(),
                    contenido: content.trim(),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Guardar Cambios'),
          ),
        ],
      );
    },
  );
}

Future<bool> showDeleteNoteDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text('Confirmar Eliminación'),
            content: const Text(
              '¿Estás seguro de que deseas eliminar esta nota?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Eliminar'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        },
      ) ??
      false;
}
