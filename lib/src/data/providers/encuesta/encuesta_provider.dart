import 'dart:convert';

import 'package:covid19_itc/src/data/keys.dart';
import 'package:covid19_itc/src/device/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:covid19_itc/src/data/entities/encuesta.dart';
import 'package:covid19_itc/src/data/changenotifier_with_state.dart';
import 'package:covid19_itc/src/data/providers/encuesta/encuesta_state.dart';

class EncuestaProvider extends ChangeNotifierWithState<EncuestaState> {
  EncuestaProvider() {
    setState(EncuestaState(encuestas: [], loading: false));
    this.fetchEncuestas();
  }

  void fetchEncuestas() async {
    setState(state.copyWith(loading: true));
    List<Encuesta> encuestas = [];
    final usuario = SharedPrefs().usuario;
    final url = "$BASE_URL/encuesta/usuario/${usuario?.usuarioId}";
    try {
      final resp = await http.get(Uri.parse(url), headers: {"Authorization": "Bearer ${usuario?.token}"});
      final body = json.decode(resp.body);
      encuestas = body.map<Encuesta>((x) => Encuesta.fromMap(x)).toList();
    } catch (e) {
      print(e);
    }

    setState(state.copyWith(loading: false, encuestas: encuestas));
  }
}
