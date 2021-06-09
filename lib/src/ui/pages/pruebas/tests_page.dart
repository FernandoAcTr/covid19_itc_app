import 'package:covid19_itc/src/data/entities/prueba.dart';
import 'package:covid19_itc/src/data/providers/prueba/prueba_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pruebas de Covid-19'),
      ),
      body: _TestList(),
    );
  }
}

class _TestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PruebaProvider>(context);
    return provider.state.loading
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: () async => provider.fetchPruebas(),
            child: ListView.builder(
              itemCount: provider.state.pruebas.length,
              itemBuilder: (_, index) {
                return _TestItem(
                  prueba: provider.state.pruebas[index],
                  positive: provider.state.pruebas[index].resultado == "POSITIVO",
                );
              },
            ),
          );
  }
}

class _TestItem extends StatelessWidget {
  final Prueba prueba;
  final bool positive;

  const _TestItem({
    required this.prueba,
    required this.positive,
  });

  @override
  Widget build(BuildContext context) {
    final stringFecha = DateFormat.yMMMMEEEEd().format(prueba.fechaDeteccion!);
    return ListTile(
      title: Text(stringFecha),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.prueba.resultado!,
              style: TextStyle(color: this.positive ? Theme.of(context).accentColor : Theme.of(context).primaryColor)),
          Text('Tipo: ${prueba.tipo.descripcion}'),
          Text('Médico: ${prueba.medico.nombre} ${prueba.medico.aPaterno} ${prueba.medico.aMaterno}'),
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: this.positive ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
        child: Icon(
          this.positive ? Icons.add_alert : Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
