import 'dart:convert';

class Alerta {
  String alertaId;
  String alerta;
  String status;
  DateTime createAt;
  DateTime updateAt;

  Alerta({
    required this.alertaId,
    required this.alerta,
    required this.status,
    required this.createAt,
    required this.updateAt,
  });

  factory Alerta.fromJson(String str) => Alerta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Alerta.fromMap(Map<String, dynamic> json) => Alerta(
        alertaId: json["alerta_id"],
        alerta: json["alerta"],
        status: json["status"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toMap() => {
        "alerta_id": alertaId,
        "alerta": alerta,
        "status": status,
        "create_at": createAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
      };
}
