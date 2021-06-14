import 'dart:io';

import 'package:covid19_itc/src/data/entities/consulta.dart';
import 'package:equatable/equatable.dart';

class ConsultaState extends Equatable {
  final String? modalidad;
  final bool loading;
  final List<Consulta> consultas;
  final List<File> evidencias;

  ConsultaState({
    this.modalidad,
    required this.consultas,
    required this.loading,
    required this.evidencias,
  });

  @override
  List<Object?> get props => [modalidad, consultas, loading, evidencias];

  @override
  bool? get stringify => true;

  ConsultaState copyWith({
    String? modalidad,
    String? sintomas,
    List<Consulta>? consultas,
    List<File>? evidencias,
    bool? loading,
  }) =>
      ConsultaState(
        modalidad: modalidad ?? this.modalidad,
        consultas: consultas ?? this.consultas,
        loading: loading ?? this.loading,
        evidencias: evidencias ?? this.evidencias,
      );
}
