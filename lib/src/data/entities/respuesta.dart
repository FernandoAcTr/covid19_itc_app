import 'dart:convert';

import 'package:covid19_itc/src/data/entities/pregunta.dart';

class Respuesta {
  String? respuesta;
  Pregunta? pregunta;

  Respuesta({
    this.respuesta,
    this.pregunta,
  });

  factory Respuesta.fromJson(String str) => Respuesta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Respuesta.fromMap(Map<String, dynamic> json) => Respuesta(
        respuesta: json['respuesta'],
        pregunta: Pregunta.fromMap(json["pregunta"]),
      );

  Map<String, dynamic> toMap() => {
        "respuesta": respuesta,
        "pregunta": pregunta?.toMap(),
      };
}
