import 'dart:math';

import 'package:covid19_itc/src/data/entities/consulta.dart';
import 'package:covid19_itc/src/data/entities/medico.dart';
import 'package:covid19_itc/src/data/changenotifier_with_state.dart';
import 'package:covid19_itc/src/data/providers/consulta/consulta_state.dart';

class ConsultaProvider extends ChangeNotifierWithState<ConsultaState> {
  bool _active = true;

  ConsultaProvider() {
    setState(ConsultaState(
      modalidad: null,
      consultas: [],
      loading: false,
    ));
    fetchConsultas();
  }

  set modalidad(String? value) => setState(state.copyWith(modalidad: value));

  fetchConsultas() async {
    setState(state.copyWith(loading: true));
    await Future.delayed(Duration(seconds: 2));
    final List<Consulta> consultas = [];

    final consulta = Consulta(
      solicitudId: '456',
      sintomas: 'Lorem Ipsum Dolo',
      modalidad: 'Virtual',
      status: 'Pendiente',
      medico: Medico(
        aMaterno: 'Juan',
        aPaterno: 'Garcia',
        nombre: 'Marquez',
        medicoId: '1234567',
      ),
      fechaAtencion: DateTime.now(),
    );

    consultas.add(consulta);
    setState(state.copyWith(loading: false, consultas: consultas), notify: _active);
  }

  addConsulta(String sintomas, String modalidad) {
    final currentList = state.consultas;
    currentList.add(Consulta(
      sintomas: sintomas,
      modalidad: modalidad,
      status: 'Pendiente',
      solicitudId: Random().nextInt(1000).toString(),
    ));
    setState(ConsultaState(consultas: currentList, loading: false, modalidad: null));
  }

  deleteConsulta(String solicitudId) {
    final currentList = state.consultas;
    final newList = currentList.where((element) => element.solicitudId != solicitudId).toList();
    setState(state.copyWith(consultas: newList));
  }

  @override
  void dispose() {
    super.dispose();
    _active = false;
  }
}
