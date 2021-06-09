import 'package:covid19_itc/src/data/entities/prueba.dart';
import 'package:equatable/equatable.dart';

class PruebaState extends Equatable {
  final List<Prueba> pruebas;
  final bool loading;

  PruebaState({
    required this.pruebas,
    required this.loading,
  });

  @override
  List<Object?> get props => [pruebas, loading];

  @override
  bool? get stringify => true;

  PruebaState copyWith({
    List<Prueba>? pruebas,
    bool? loading,
  }) =>
      PruebaState(
        pruebas: pruebas ?? this.pruebas,
        loading: loading ?? this.loading,
      );
}
