import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:covid19_itc/src/ui/pages/consultas/constultas_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsultaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<FormController>(context).formConsultaKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: Provider.of<ConsultaProvider>(context).state.modalidad,
            hint: Text('Modalidad'),
            items: [
              DropdownMenuItem(
                child: Text('Virtual'),
                value: 'virtual',
              ),
              DropdownMenuItem(
                child: Text('Presencial'),
                value: 'presencial',
              ),
            ],
            isExpanded: true,
            onChanged: (value) => Provider.of<ConsultaProvider>(context, listen: false).modalidad = value,
          ),
          SizedBox(height: 15),
          TextFormField(
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            maxLength: 300,
            decoration: InputDecoration(
              hintText: 'Describe tus síntomas....',
            ),
            controller: Provider.of<FormController>(context).txtSintomasController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obligatorio';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
