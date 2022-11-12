class LetraMusica {

  int? id;
  String? tipo;
  String? titulo;
  String? letra;

  LetraMusica({ this.id,  this.tipo,  this.titulo,  this.letra});

  Map<String, dynamic> toMap() {
    return { 'id': id, 'tipo': tipo, 'titulo': titulo,'letra': letra};
  }
}