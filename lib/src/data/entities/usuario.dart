import 'dart:convert';

class Usuario {
  String usuarioId;
  String email;
  bool habilitado;
  bool requireSurvey;
  String rol;
  String nombre;
  String aPaterno;
  String aMaterno;
  String? token;

  Usuario({
    required this.usuarioId,
    required this.email,
    required this.habilitado,
    required this.requireSurvey,
    required this.rol,
    required this.nombre,
    required this.aPaterno,
    required this.aMaterno,
    required this.token,
  });

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        usuarioId: json['usuario']['usuario_id'],
        email: json['usuario']['email'],
        habilitado: json['usuario']['habilitado'],
        requireSurvey: json['usuario']['requireSurvey'],
        rol: json['usuario']['rol']['rol'],
        nombre: json['usuario'][json['usuario']['rol']['rol']]['nombre'],
        aPaterno: json['usuario'][json['usuario']['rol']['rol']]['a_paterno'],
        aMaterno: json['usuario'][json['usuario']['rol']['rol']]['a_materno'],
        token: json['token'],
      );

  Map<String, dynamic> toMap() => {
        'token': token,
        'usuario': {
          'usuario_id': usuarioId,
          'email': email,
          'habilitado': habilitado,
          'requireSurvey': requireSurvey,
          'rol': {
            'rol': rol,
          },
          rol: {
            'nombre': nombre,
            'a_paterno': aPaterno,
            'a_materno': aMaterno,
          }
        },
      };
}
