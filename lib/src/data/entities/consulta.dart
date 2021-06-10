import 'dart:convert';

import 'package:covid19_itc/src/data/entities/medico.dart';

class Consulta {
  String solicitudId;
  DateTime? fechaAtencion;
  Medico? medico;
  String sintomas;
  String modalidad;
  String status;

  Consulta({
    required this.solicitudId,
    required this.sintomas,
    required this.modalidad,
    required this.status,
    this.fechaAtencion,
    this.medico,
  });

  factory Consulta.fromJson(String str) => Consulta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Consulta.fromMap(Map<String, dynamic> json) => Consulta(
        solicitudId: json["solicitud_id"],
        sintomas: json["sintomas"],
        modalidad: json["modalidad"],
        status: json["status"],
        fechaAtencion: json["fecha_atencion"] != null ? DateTime.parse(json["fecha_atencion"]) : null,
        medico: json["medico"] != null ? Medico.fromMap(json["medico"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "solicitud_id": solicitudId,
        "sintomas": sintomas,
        "modalidad": modalidad,
        "status": status,
        "fecha_atencion": fechaAtencion?.toIso8601String(),
        "medico": medico?.toMap(),
      };
}
