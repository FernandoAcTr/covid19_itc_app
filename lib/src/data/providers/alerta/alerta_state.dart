import 'package:covid19_itc/src/data/entities/alerta.dart';
import 'package:equatable/equatable.dart';

class AlertaState extends Equatable {
  final List<Alerta> alertas;
  final bool loading;

  AlertaState({
    required this.alertas,
    required this.loading,
  });

  @override
  List<Object?> get props => [alertas, loading];

  @override
  bool? get stringify => true;

  AlertaState copyWith({
    List<Alerta>? alertas,
    bool? loading,
  }) =>
      AlertaState(
        alertas: alertas ?? this.alertas,
        loading: loading ?? this.loading,
      );
}
