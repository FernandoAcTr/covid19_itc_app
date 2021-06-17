import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid19_itc/src/data/entities/prueba.dart';
import 'package:covid19_itc/src/data/changenotifier_with_state.dart';
import 'package:covid19_itc/src/data/providers/prueba/prueba_state.dart';
import 'package:covid19_itc/src/data/keys.dart';
import 'package:covid19_itc/src/device/shared_prefs.dart';

class PruebaProvider extends ChangeNotifierWithState<PruebaState> {
  PruebaProvider() {
    setState(PruebaState(pruebas: [], loading: false));
    this.fetchPruebas();
  }

  void fetchPruebas() async {
    setState(state.copyWith(loading: true));
    final usuario = SharedPrefs().usuario;
    List<Prueba> pruebas = [];
    final url = "$BASE_URL/ordenes/usuario/${usuario?.usuarioId}";

    try {
      final resp = await http.get(Uri.parse(url), headers: {'Authorization': "Bearer ${usuario?.token}"});
      final body = json.decode(resp.body);
      pruebas = body.map<Prueba>((x) => Prueba.fromMap(x)).toList();
      pruebas = pruebas.where((x) => x.fechaDeteccion != null).toList();
      print(pruebas);
    } catch (e) {
      print(e);
    }
    setState(state.copyWith(loading: false, pruebas: pruebas));
  }
}
