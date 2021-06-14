import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/evidencias_list.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/floating_buttons.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_list.dart';
import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_form.dart';

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
              EvidenciasList(), 
              ConsultaList(),
            ],
          ),
        ),
        floatingActionButton: FloatingButtons(),
      ),
    );
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
