import 'package:notas_app/models/nota.dart';
import 'database_provider.dart';
import 'schema.dart';

class NotaCRUD {
  final DatabaseProvider _provider = DatabaseProvider();

  Future<int> insertNota(Nota nota) async {
    final db = await _provider.database;
    return await db.insert(NotaSchema.tableName, nota.toMap());
  }

  Future<List<Nota>> getNotas() async {
    final db = await _provider.database;
    final List<Map<String, dynamic>> maps = await db.query(
      NotaSchema.tableName,
    );
    return List.generate(maps.length, (i) {
      return Nota.fromMap(maps[i]);
    });
  }

  Future<int> updateNota(Nota nota) async {
    final db = await _provider.database;
    return await db.update(
      NotaSchema.tableName,
      nota.toMap(),
      where: '${NotaSchema.columnId} = ?',
      whereArgs: [nota.id],
    );
  }

  Future<int> deleteNota(int id) async {
    final db = await _provider.database;
    return await db.delete(
      NotaSchema.tableName,
      where: '${NotaSchema.columnId} = ?',
      whereArgs: [id],
    );
  }
}
