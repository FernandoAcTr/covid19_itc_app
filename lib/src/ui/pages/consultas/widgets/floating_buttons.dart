import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:covid19_itc/src/ui/pages/consultas/constultas_page.dart';
import 'package:covid19_itc/src/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class FloatingButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      backgroundColor: Theme.of(context).accentColor,
      foregroundColor: Colors.white,
      overlayOpacity: 0,
      children: [
        SpeedDialChild(
          child: Icon(Icons.add_a_photo),
          label: 'Agregar evidencia',
          backgroundColor: Colors.green,
          onTap: () {},
        ),
        SpeedDialChild(
          child: Icon(Icons.save),
          label: 'Programar la consulta',
          backgroundColor: Colors.amber,
          onTap: () {
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
        ),
      ],
    );
  }
}
