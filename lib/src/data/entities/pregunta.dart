import 'dart:convert';

class Pregunta {
  int? preguntaId;
  String? pregunta;

  Pregunta({
    this.preguntaId,
    this.pregunta,
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
