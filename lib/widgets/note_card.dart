// widgets/note_card.dart

import 'package:flutter/material.dart';
import '../models/nota.dart';

class NoteCard extends StatelessWidget {
  final Nota nota;
  final Function() onEdit;
  final Function() onDelete;

  const NoteCard({
    super.key,
    required this.nota,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colores = [
      Colors.amber.shade100,
      Colors.lightBlue.shade100,
      Colors.green.shade100,
      Colors.purple.shade100,
      Colors.orange.shade100,
      Colors.teal.shade100,
    ];

    final cardColor = colores[nota.id!.toInt() % colores.length];

    return Card(
      color: cardColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.note, color: Colors.black54),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    nota.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              nota.contenido,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.deepOrange),
                  tooltip: "Editar",
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  tooltip: "Eliminar",
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
