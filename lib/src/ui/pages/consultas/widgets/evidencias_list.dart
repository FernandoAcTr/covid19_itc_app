import 'dart:io';

import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EvidenciasList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConsultaProvider>(context);
    final children = provider.state.evidencias.map((e) => _Image(image: e)).toList();
    return Container(
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final File image;

  const _Image({required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.file(image, height: 150),
        TextButton(
          onPressed: () {
            Provider.of<ConsultaProvider>(context, listen: false).deleteEvidence(image);
          },
          child: Text('Borrar'),
        ),
      ],
    );
  }
}
