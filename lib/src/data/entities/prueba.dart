import 'dart:convert';

import 'package:covid19_itc/src/data/entities/medico.dart';
import 'package:covid19_itc/src/data/entities/usuario.dart';

class Prueba {
  String ordenId;
  String? resultado;
  DateTime? fechaDeteccion;
  Usuario usuario;
  Medico medico;
  Tipo tipo;

  Prueba({
    required this.ordenId,
    this.resultado,
    this.fechaDeteccion,
    required this.usuario,
    required this.medico,
    required this.tipo,
  });

  factory Prueba.fromJson(String str) => Prueba.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prueba.fromMap(Map<String, dynamic> json) => Prueba(
        ordenId: json["orden_id"],
        resultado: json["resultado"],
        fechaDeteccion: DateTime.parse(json["fecha_deteccion"]),
        usuario: Usuario.fromMap(json["usuario"]),
        medico: Medico.fromMap(json["medico"]),
        tipo: Tipo.fromMap(json["tipo"]),
      );

  Map<String, dynamic> toMap() => {
        "orden_id": ordenId,
        "resultado": resultado,
        "fecha_deteccion": fechaDeteccion?.toIso8601String(),
        "usuario": usuario.toMap(),
        "medico": medico.toMap(),
        "tipo": tipo.toMap(),
      };
}

class Tipo {
  int tipoId;
  String descripcion;

  Tipo({
    required this.tipoId,
    required this.descripcion,
  });

  factory Tipo.fromJson(String str) => Tipo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tipo.fromMap(Map<String, dynamic> json) => Tipo(
        tipoId: json["tipo_id"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "tipo_id": tipoId,
        "descripcion": descripcion,
      };
}
