class NotaSchema {
  static const String tableName = 'notas';

  static const String columnId = 'id';
  static const String columnTitulo = 'titulo';
  static const String columnContenido = 'contenido';

  static String createTable =
      '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTitulo TEXT NOT NULL,
      $columnContenido TEXT NOT NULL
    )
  ''';
}
