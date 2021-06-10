import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_card.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_form.dart';
import 'package:covid19_itc/src/ui/utils.dart';

class ConsultasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConsultaProvider(),
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
        if (provider.state.modalidad == null || !provider.formConsultaKey.currentState!.validate()) {
          showSnackBar(text: 'Elige una modalidad e ingresa tus síntomas', context: context);
        } else {
          showSnackBar(text: 'Consulta programada. Espera a que un médico te asigne una fecha', context: context);
          provider.addConsulta(provider.txtSintomasController.text, provider.state.modalidad!);
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
        : Column(
            children: children,
          );
  }
}
