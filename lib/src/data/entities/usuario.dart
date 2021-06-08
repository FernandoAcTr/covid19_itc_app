import 'dart:convert';

class Usuario {
  String usuarioId;
  String email;

  Usuario({
    required this.usuarioId,
    required this.email,
  });

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        usuarioId: json["usuario_id"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "usuario_id": usuarioId,
        "email": email,
      };
}
