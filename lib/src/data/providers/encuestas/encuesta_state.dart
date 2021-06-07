import 'package:covid19_itc/src/data/entities/encuesta.dart';
import 'package:equatable/equatable.dart';

class EncuestaState extends Equatable {
  final List<Encuesta> encuestas;
  final bool loading;

  EncuestaState({
    required this.encuestas,
    required this.loading,
  });

  @override
  List<Object?> get props => [encuestas, loading];

  @override
  bool? get stringify => true;

  EncuestaState copyWith({
    List<Encuesta>? encuestas,
    bool? loading,
  }) =>
      EncuestaState(
        encuestas: encuestas ?? this.encuestas,
        loading: loading ?? this.loading,
      );
}
