import 'package:covid19_itc/src/data/entities/consulta.dart';
import 'package:equatable/equatable.dart';

class ConsultaState extends Equatable {
  final String? modalidad;
  final bool loading;
  final List<Consulta> consultas;

  ConsultaState({
    this.modalidad,
    required this.consultas,
    required this.loading,
  });

  @override
  List<Object?> get props => [modalidad, consultas, loading];

  @override
  bool? get stringify => true;

  ConsultaState copyWith({
    String? modalidad,
    String? sintomas,
    List<Consulta>? consultas,
    bool? loading,
  }) =>
      ConsultaState(
        modalidad: modalidad ?? this.modalidad,
        consultas: consultas ?? this.consultas,
        loading: loading ?? this.loading,
      );
}
