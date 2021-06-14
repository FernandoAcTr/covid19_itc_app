import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:covid19_itc/src/data/keys.dart';
import 'package:covid19_itc/src/data/entities/consulta.dart';
import 'package:covid19_itc/src/data/changenotifier_with_state.dart';
import 'package:covid19_itc/src/data/providers/consulta/consulta_state.dart';
import 'package:covid19_itc/src/device/shared_prefs.dart';

class ConsultaProvider extends ChangeNotifierWithState<ConsultaState> {
  bool _active = true;
  final prefs = SharedPrefs();
  ConsultaProvider() {
    setState(ConsultaState(
      modalidad: null,
      consultas: [],
      evidencias: [],
      loading: false,
    ));
    fetchConsultas();
  }

  set modalidad(String? value) => setState(state.copyWith(modalidad: value));

  fetchConsultas() async {
    setState(state.copyWith(loading: true));
    await Future.delayed(Duration(seconds: 2));
    List<Consulta> consultas = [];
    final usuario = prefs.usuario;
    final url = "$BASE_URL/consultas/usuario/${usuario?.usuarioId}";
    try {
      final resp = await http.get(Uri.parse(url), headers: {'Authorization': 'Bearer ${usuario?.token}'});
      final listConsultas = json.decode(resp.body);
      final pendientes = listConsultas.where((x) => x['status'] == 'pendiente');
      consultas = pendientes.map<Consulta>((x) => Consulta.fromMap(x)).toList();
    } catch (e) {
      print(e);
    }
    setState(state.copyWith(loading: false, consultas: consultas), notify: _active);
  }

  addConsulta(String sintomas, String modalidad) async {
    setState(state.copyWith(loading: true));
    final currentList = state.consultas;
    final usuario = prefs.usuario;
    final url = "$BASE_URL/consultas";
    final List<http.MultipartFile> multiPartFiles = [];

    try {
      for (var file in state.evidencias) {
        final multiPartFile = await http.MultipartFile.fromPath('evidencias', file.path);
        multiPartFiles.add(multiPartFile);
      }
      final request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll({'Authorization': "Bearer ${usuario?.token}"})
        ..fields.addAll(
          {
            'usuario_id': "${usuario?.usuarioId}",
            'sintomas': "$sintomas",
            'modalidad': "$modalidad",
          },
        )
        ..files.addAll(multiPartFiles);

      final resp = await request.send();
      final respStr = await resp.stream.bytesToString();
      final consulta = Consulta.fromJson(respStr);
      currentList.add(consulta);
    } catch (e) {
      print(e);
    }
    setState(ConsultaState(consultas: currentList, loading: false, modalidad: null, evidencias: []));
  }

  deleteConsulta(String solicitudId) async {
    setState(state.copyWith(loading: true));
    var list = state.consultas;
    final usuario = prefs.usuario;
    final url = "$BASE_URL/consultas/$solicitudId";
    try {
      await http.delete(Uri.parse(url), headers: {'Authorization': "Bearer ${usuario?.token}"});
      list = list.where((element) => element.solicitudId != solicitudId).toList();
    } catch (e) {
      print(e);
    }
    setState(state.copyWith(loading: false, consultas: list));
  }

  addEvidence(File evidence) {
    final currentEvidenceList = state.evidencias;
    currentEvidenceList.add(evidence);
    setState(state.copyWith(evidencias: currentEvidenceList));
  }

  deleteEvidence(File evidence) {
    final currentEvidenceList = state.evidencias;
    currentEvidenceList.remove(evidence);
    setState(state.copyWith(evidencias: currentEvidenceList));
  }

  @override
  void dispose() {
    super.dispose();
    _active = false;
  }
}
