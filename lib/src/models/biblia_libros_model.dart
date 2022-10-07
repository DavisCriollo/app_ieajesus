// // To parse this JSON data, do
//
//     final bibliaLibrosController = bibliaLibrosControllerFromMap(jsonString);

import 'dart:convert';

class BibliaLibrosController {
    BibliaLibrosController({
        required this.biblia,
    });

    Map<String, List<List<String>>> biblia;

    factory BibliaLibrosController.fromJson(String str) => BibliaLibrosController.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BibliaLibrosController.fromMap(Map<String, dynamic> json) => BibliaLibrosController(
        biblia: Map.from(json["biblia"]).map((k, v) => MapEntry<String, List<List<String>>>(k, List<List<String>>.from(v.map((x) => List<String>.from(x.map((x) => x)))))),
    );

    Map<String, dynamic> toMap() => {
        "biblia": Map.from(biblia).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => List<dynamic>.from(x.map((x) => x)))))),
    };
}
