// To parse this JSON data, do
//
//     final letraMusicaList = letraMusicaListFromMap(jsonString);

import 'dart:convert';

class LetraMusicaList {
    LetraMusicaList({
        required this.data,
    });

    List<Musicas> data;

    factory LetraMusicaList.fromJson(String str) => LetraMusicaList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LetraMusicaList.fromMap(Map<String, dynamic> json) => LetraMusicaList(
        data: List<Musicas>.from(json["data"].map((x) => Musicas.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Musicas {
    Musicas({
        this.genId,
        this.genTipo,
        this.genTitulo,
        this.genDescripcion,
        this.genFecReg,
    });

    int? genId;
    String? genTipo;
    String? genTitulo;
    String? genDescripcion;
    DateTime? genFecReg;

    factory Musicas.fromJson(String str) => Musicas.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Musicas.fromMap(Map<String, dynamic> json) => Musicas(
        genId: json["genId"],
        genTipo: json["genTipo"],
        genTitulo: json["genTitulo"],
        genDescripcion: json["genDescripcion"],
        genFecReg: DateTime.parse(json["genFecReg"]),
    );

    Map<String, dynamic> toMap() => {
        "genId": genId,
        "genTipo": genTipo,
        "genTitulo": genTitulo,
        "genDescripcion": genDescripcion,
        "genFecReg": genFecReg.toString(),
    };
}
