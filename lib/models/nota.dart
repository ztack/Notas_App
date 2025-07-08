class Nota {
  final int? id;
  final String titulo;
  final String contenido;

  Nota({this.id, required this.titulo, required this.contenido});

  Map<String, dynamic> toMap() {
    return {'id': id, 'titulo': titulo, 'contenido': contenido};
  }

  factory Nota.fromMap(Map<String, dynamic> map) {
    return Nota(
      id: map['id'],
      titulo: map['titulo'],
      contenido: map['contenido'],
    );
  }

  @override
  String toString() {
    return 'Nota{id: $id, titulo: $titulo, contenido: $contenido}';
  }
}
