import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_card.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_form.dart';
import 'package:covid19_itc/src/ui/utils.dart';

class ConsultasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConsultaProvider()),
        Provider(create: (_) => FormController()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Consultas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              ConsultaForm(),
              SizedBox(height: 15),
              ListConsultas(),
            ],
          ),
        ),
        floatingActionButton: _FloatingButton(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).accentColor,
      onPressed: () {
        final provider = Provider.of<ConsultaProvider>(context, listen: false);
        final formController = Provider.of<FormController>(context, listen: false);
        if (provider.state.modalidad == null || !formController.formConsultaKey.currentState!.validate()) {
          showSnackBar(text: 'Elige una modalidad e ingresa tus síntomas', context: context);
        } else {
          provider.addConsulta(formController.txtSintomasController.text, provider.state.modalidad!);
          showSnackBar(text: 'Consulta programada. Espera a que un médico te asigne una fecha', context: context);
          formController.resetForm();
          FocusScope.of(context).unfocus();
        }
      },
    );
  }
}

class ListConsultas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConsultaProvider>(context);
    final List<Widget> children = provider.state.consultas.map<ConsultaCard>((item) => ConsultaCard(item)).toList();

    return provider.state.loading
        ? Center(child: CircularProgressIndicator())
        : children.length > 0
            ? Column(children: children)
            : Center(child: Text('No tienes ninguna consulta programada'));
  }
}

class FormController {
  final _txtSintomasController = TextEditingController();
  final _formConsultaKey = GlobalKey<FormState>();

  get txtSintomasController => _txtSintomasController;
  get formConsultaKey => _formConsultaKey;

  resetForm() {
    _txtSintomasController.text = '';
  }
}
