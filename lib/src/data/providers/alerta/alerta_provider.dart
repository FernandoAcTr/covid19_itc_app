import 'dart:math';

import 'package:covid19_itc/src/data/entities/alerta.dart';
import 'package:covid19_itc/src/data/providers/alerta/alerta_state.dart';
import 'package:covid19_itc/src/data/providers/changenotifier_with_state.dart';

class AlertaProvider extends ChangeNotifierWithState<AlertaState> {
  bool _active = true;

  AlertaProvider() {
    setState(AlertaState(
      alertas: [],
      loading: false,
    ));
    fetchAlerts();
  }

  fetchAlerts() async {
    setState(state.copyWith(loading: true));
    await Future.delayed(Duration(seconds: 2));
    final List<Alerta> alertas = [];

    final alerta1 = Alerta(
      alertaId: Random(1000).toString(),
      alerta: 'Lorem Ipsum Dolo With',
      status: 'PENDIENTE',
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
    );

    final alerta2 = Alerta(
      alertaId: Random(1000).toString(),
      alerta: 'Lorem Ipsum Dolo With',
      status: 'PENDIENTE',
      createAt: DateTime(2021, 6, 9),
      updateAt: DateTime.now(),
    );

    final alerta3 = Alerta(
      alertaId: Random(1000).toString(),
      alerta: 'Lorem Ipsum Dolo With',
      status: 'LEIDA',
      createAt: DateTime(2021, 6, 9),
      updateAt: DateTime.now(),
    );

    alertas.add(alerta1);
    alertas.add(alerta1);
    alertas.add(alerta2);
    alertas.add(alerta2);
    alertas.add(alerta3);
    alertas.add(alerta3);
    alertas.add(alerta3);
    alertas.add(alerta3);

    setState(state.copyWith(loading: false, alertas: alertas), notify: _active);
  }

  List<Alerta> get todayAlerts {
    final today = DateTime.now();
    final todayAlerts =
        state.alertas.where((alert) => alert.status == 'PENDIENTE' && alert.createAt.day == today.day).toList();

    return todayAlerts;
  }

  List<Alerta> get previousAlerts {
    final today = DateTime.now();
    final todayAlerts =
        state.alertas.where((alert) => alert.status == 'PENDIENTE' && alert.createAt.day != today.day).toList();

    return todayAlerts;
  }

  List<Alerta> get historyAlerts {
    return state.alertas.where((alert) => alert.status != 'PENDIENTE').toList();
  }

  @override
  void dispose() {
    super.dispose();
    _active = false;
  }
}
