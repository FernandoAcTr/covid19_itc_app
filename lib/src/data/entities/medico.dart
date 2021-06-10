import 'dart:convert';

class Medico {
  String nombre;
  String aPaterno;
  String aMaterno;
  String medicoId;

  Medico({
    required this.nombre,
    required this.aPaterno,
    required this.aMaterno,
    required this.medicoId,
  });

  factory Medico.fromJson(String str) => Medico.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Medico.fromMap(Map<String, dynamic> json) => Medico(
        nombre: json["nombre"],
        aPaterno: json["a_paterno"],
        aMaterno: json["a_materno"],
        medicoId: json["medico_id"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "a_paterno": aPaterno,
        "a_materno": aMaterno,
        "medico_id": medicoId,
      };
}
