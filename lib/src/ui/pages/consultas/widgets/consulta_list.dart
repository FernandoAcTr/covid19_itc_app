import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:covid19_itc/src/ui/pages/consultas/widgets/consulta_card.dart';

class ConsultaList extends StatelessWidget {
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
