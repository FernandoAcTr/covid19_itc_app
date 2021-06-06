import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_card.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_form.dart';
import 'package:flutter/material.dart';

class ConsultasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      mini: true,
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}

class ListConsultas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConsultaCard(),
        ConsultaCard(),
        ConsultaCard(),
      ],
    );
  }
}
