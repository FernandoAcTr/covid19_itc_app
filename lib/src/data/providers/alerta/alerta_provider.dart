import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid19_itc/src/data/entities/alerta.dart';
import 'package:covid19_itc/src/data/keys.dart';
import 'package:covid19_itc/src/data/providers/alerta/alerta_state.dart';
import 'package:covid19_itc/src/data/changenotifier_with_state.dart';
import 'package:covid19_itc/src/device/shared_prefs.dart';

class AlertaProvider extends ChangeNotifierWithState<AlertaState> {
  bool _active = true;
  late final SharedPrefs _prefs;

  AlertaProvider() {
    _prefs = SharedPrefs();
    setState(AlertaState(
      alertas: [],
      loading: false,
    ));
    fetchAlerts();
  }

  fetchAlerts() async {
    setState(state.copyWith(loading: true));
    await Future.delayed(Duration(seconds: 2));
    List<Alerta> alertas = [];
    final usuario = _prefs.usuario;
    final url = "$BASE_URL/alertas/usuario/${usuario?.usuarioId}";

    try {
      final resp = await http.get(Uri.parse(url), headers: {'Authorization': "Bearer ${usuario?.token}"});
      final body = json.decode(resp.body);
      alertas = body.map<Alerta>((x) => Alerta.fromMap(x)).toList();
    } catch (e) {
      print(e);
    }

    setState(state.copyWith(loading: false, alertas: alertas), notify: _active);
  }

  readAlert(Alerta alerta) async {
    final url = "$BASE_URL/alertas/${alerta.alertaId}";
    final usuario = _prefs.usuario;
    try {
      final resp = http.put(
        Uri.parse(url),
        body: {'status': 'leida'},
        headers: {'Authorization': "Bearer ${usuario?.token}"},
      );
      print(resp);
      alerta.status = 'leida';
      final alertList = state.alertas;
      final newList = alertList.map((x) => x.alertaId == alerta.alertaId ? alerta : x).toList();
      setState(state.copyWith(alertas: newList));
    } catch (e) {
      print(e);
    }
  }

  List<Alerta> get todayAlerts {
    final today = DateTime.now();
    final todayAlerts =
        state.alertas.where((alert) => alert.status == 'pendiente' && alert.createAt.day >= today.day).toList();

    return todayAlerts;
  }

  List<Alerta> get previousAlerts {
    final today = DateTime.now();
    final todayAlerts =
        state.alertas.where((alert) => alert.status == 'pendiente' && alert.createAt.day < today.day).toList();

    return todayAlerts;
  }

  List<Alerta> get historyAlerts {
    return state.alertas.where((alert) => alert.status != 'pendiente').toList();
  }

  @override
  void dispose() {
    super.dispose();
    _active = false;
  }
}
