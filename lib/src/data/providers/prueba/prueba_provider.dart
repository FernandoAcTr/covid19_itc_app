import 'package:covid19_itc/src/data/entities/medico.dart';
import 'package:covid19_itc/src/data/entities/prueba.dart';
import 'package:covid19_itc/src/data/providers/changenotifier_with_state.dart';
import 'package:covid19_itc/src/data/providers/prueba/prueba_state.dart';

class PruebaProvider extends ChangeNotifierWithState<PruebaState> {
  PruebaProvider() {
    setState(PruebaState(pruebas: [], loading: false));
    this.fetchPruebas();
  }

  void fetchPruebas() async {
    setState(state.copyWith(loading: true));
    await Future.delayed(Duration(seconds: 2));
    final List<Prueba> pruebas = [];
    final prueba = Prueba(
      ordenId: '1',
      tipo: Tipo(tipoId: 1, descripcion: 'PCR'),
      medico: Medico(
        aMaterno: 'Juan',
        aPaterno: 'Garcia',
        nombre: 'Marquez',
        medicoId: '1234567',
      ),
      fechaDeteccion: DateTime.now(),
      resultado: 'NEGATIVO',
    );
    pruebas.add(prueba);
    pruebas.add(prueba);
    pruebas.add(prueba);
    pruebas.add(prueba);
    setState(state.copyWith(loading: false, pruebas: pruebas));
  }
}
