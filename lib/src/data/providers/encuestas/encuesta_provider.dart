import 'package:covid19_itc/src/data/entities/encuesta.dart';
import 'package:covid19_itc/src/data/entities/pregunta.dart';
import 'package:covid19_itc/src/data/entities/respuesta.dart';
import 'package:covid19_itc/src/data/providers/changenotifier_with_state.dart';
import 'package:covid19_itc/src/data/providers/encuestas/encuesta_state.dart';

class EncuestaProvider extends ChangeNotifierWithState<EncuestaState> {
  EncuestaProvider() {
    setState(EncuestaState(encuestas: [], loading: false));
    this.fetchEncuestas();
  }

  void fetchEncuestas() async {
    setState(state.copyWith(loading: true));
    await Future.delayed(Duration(seconds: 2));
    final List<Encuesta> encuestas = [];
    final pregunta1 = Pregunta(preguntaId: 1, pregunta: '¿Tienes dirrea?');
    final pregunta2 = Pregunta(preguntaId: 1, pregunta: '¿Tienes problemas al respirar?');
    final pregunta3 = Pregunta(preguntaId: 1, pregunta: '¿Tienes secresion nasal?');
    final respuesta1 = Respuesta(pregunta: pregunta1, respuesta: 'Si');
    final respuesta2 = Respuesta(pregunta: pregunta2, respuesta: 'Si');
    final respuesta3 = Respuesta(pregunta: pregunta3, respuesta: 'No');
    final encuesta = Encuesta(
        encuestaId: 1,
        otrosSintomas: 'Nada de nada',
        fechaAplicacion: DateTime(2021, 06, 7),
        respuestas: [respuesta1, respuesta2, respuesta3]);
    encuesta.otrosSintomas = 'No siento nada';
    encuestas.add(encuesta);
    encuestas.add(encuesta);
    encuestas.add(encuesta);
    encuestas.add(encuesta);
    setState(state.copyWith(loading: false, encuestas: encuestas));
  }
}
