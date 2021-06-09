import 'package:intl/intl.dart';
import 'package:covid19_itc/src/data/entities/encuesta.dart';
import 'package:covid19_itc/src/data/providers/encuesta/encuesta_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EncuestaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Encuestas aplicadas'),
      ),
      body: provider.state.loading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async => provider.fetchEncuestas(),
              child: ListView.builder(
                itemCount: provider.state.encuestas.length,
                itemBuilder: (_, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ListItem(provider.state.encuestas[index]),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Encuesta encuesta;
  const _ListItem(this.encuesta);

  @override
  Widget build(BuildContext context) {
    final stringFecha = DateFormat.yMMMMEEEEd().format(encuesta.fechaAplicacion);
    final children = encuesta.respuestas
        ?.map(
          (r) => ListTile(
            title: Text(r.pregunta.pregunta),
            subtitle: Text(r.respuesta),
          ),
        )
        .toList();

    children?.add(ListTile(
      title: Text('Otros sintomas'),
      subtitle: Text(encuesta.otrosSintomas!),
    ));

    return ExpansionTile(
      title: Text(stringFecha),
      leading: Icon(Icons.text_snippet),
      textColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      children: children ?? [],
    );
  }
}
