import 'package:covid19_itc/src/data/entities/consulta.dart';
import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:covid19_itc/src/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ConsultaCard extends StatelessWidget {
  final Consulta consulta;

  const ConsultaCard(this.consulta);

  @override
  Widget build(BuildContext context) {
    final stringFecha = consulta.fechaAtencion != null ? DateFormat.yMMMMEEEEd().format(consulta.fechaAtencion!) : '';
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: double.infinity,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Estatus: ${consulta.status}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Text('Fecha: $stringFecha'),
              SizedBox(height: 5),
              Text(
                  'Medico: ${consulta.medico?.nombre ?? ''} ${consulta.medico?.aPaterno ?? ''} ${consulta.medico?.aPaterno ?? ''}'),
              SizedBox(height: 5),
              Text('Modalidad: ${consulta.modalidad[0].toUpperCase() + consulta.modalidad.substring(1)}'),
              SizedBox(height: 5),
              Text('Sintomas:'),
              Text(consulta.sintomas),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: Text('Eliminar'),
                  onPressed: () {
                    Provider.of<ConsultaProvider>(context, listen: false).deleteConsulta(consulta.solicitudId);
                    showSnackBar(text: 'La consulta ha sido eliminada', context: context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
