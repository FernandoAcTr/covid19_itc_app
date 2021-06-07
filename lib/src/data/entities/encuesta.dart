import 'dart:convert';

import 'package:covid19_itc/src/data/entities/respuesta.dart';

class Encuesta {
  int? encuestaId;
  String? otrosSintomas;
  DateTime? fechaAplicacion;
  List<Respuesta>? respuestas;

  Encuesta({
    this.encuestaId,
    this.otrosSintomas,
    this.fechaAplicacion,
    this.respuestas,
  });

  factory Encuesta.fromJson(String str) => Encuesta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Encuesta.fromMap(Map<String, dynamic> json) => Encuesta(
        encuestaId: json["encuesta_id"],
        otrosSintomas: json["otros_sintomas"],
        fechaAplicacion: DateTime.parse(json["fecha_aplicacion"]),
        respuestas: List<Respuesta>.from(json["respuestas"].map((x) => Respuesta.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "encuesta_id": encuestaId,
        "otros_sintomas": otrosSintomas,
        "fecha_aplicacion": fechaAplicacion?.toIso8601String(),
        "respuestas": respuestas != null ? List<dynamic>.from(respuestas!.map((x) => x.toMap())) : null,
      };
}
