// To parse this JSON data, do
//
//     final session = sessionFromMap(jsonString);

import 'dart:convert';

class Session {
    Session({
        required this.usuario,
        required this.tipo,
        required this.codigo,
    });

    String usuario;
    String tipo;
    String codigo;

    factory Session.fromJson(String str) => Session.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Session.fromMap(Map<String, dynamic> json) => Session(
        usuario: json["usuario"],
        tipo: json["tipo"],
        codigo: json["codigo"],
    );

    Map<String, dynamic> toMap() => {
        "usuario": usuario,
        "tipo": tipo,
        "codigo": codigo,
    };
}
