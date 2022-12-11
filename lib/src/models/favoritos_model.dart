// To parse this JSON data, do
//
//     final favoritosModel = favoritosModelFromMap(jsonString);

import 'dart:convert';

class FavoritosModel {
    FavoritosModel({
        required this.libro,
        required this.capitulo,
        required this.verso,
        required this.texto,
    });

    String libro;
    int capitulo;
    int verso;
    String texto;

    factory FavoritosModel.fromJson(String str) => FavoritosModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FavoritosModel.fromMap(Map<String, dynamic> json) => FavoritosModel(
        libro: json["libro"],
        capitulo: json["capitulo"],
        verso: json["verso"],
        texto: json["texto"],
    );

    Map<String, dynamic> toMap() => {
        "libro": libro,
        "capitulo": capitulo,
        "verso": verso,
        "texto": texto,
    };
}
