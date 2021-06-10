import 'dart:convert';

class Encuesta {
  int encuestaId;
  String otrosSintomas;
  DateTime fechaAplicacion;
  List<Respuesta> respuestas;

  Encuesta({
    required this.encuestaId,
    required this.otrosSintomas,
    required this.fechaAplicacion,
    required this.respuestas,
  });

  factory Encuesta.fromJson(String str) => Encuesta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Encuesta.fromMap(Map<String, dynamic> json) => Encuesta(
        encuestaId: json["encuesta_id"],
        otrosSintomas: json["otros_sintomas"] ?? '',
        fechaAplicacion: DateTime.parse(json["fecha_aplicacion"]),
        respuestas:
            json["respuestas"] != null ? List<Respuesta>.from(json["respuestas"].map((x) => Respuesta.fromMap(x))) : [],
      );

  Map<String, dynamic> toMap() => {
        "encuesta_id": encuestaId,
        "otros_sintomas": otrosSintomas,
        "fecha_aplicacion": fechaAplicacion.toIso8601String(),
        "respuestas": List<dynamic>.from(respuestas.map((x) => x.toMap())),
      };
}

class Respuesta {
  String respuesta;
  Pregunta pregunta;

  Respuesta({
    required this.respuesta,
    required this.pregunta,
  });

  factory Respuesta.fromJson(String str) => Respuesta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Respuesta.fromMap(Map<String, dynamic> json) => Respuesta(
        respuesta: json['respuesta'],
        pregunta: Pregunta.fromMap(json["pregunta"]),
      );

  Map<String, dynamic> toMap() => {
        "respuesta": respuesta,
        "pregunta": pregunta.toMap(),
      };
}

class Pregunta {
  int preguntaId;
  String pregunta;

  Pregunta({
    required this.preguntaId,
    required this.pregunta,
  });

  factory Pregunta.fromJson(String str) => Pregunta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pregunta.fromMap(Map<String, dynamic> json) => Pregunta(
        preguntaId: json["pregunta_id"],
        pregunta: json["pregunta"],
      );

  Map<String, dynamic> toMap() => {
        "pregunta_id": preguntaId,
        "pregunta": pregunta,
      };
}
