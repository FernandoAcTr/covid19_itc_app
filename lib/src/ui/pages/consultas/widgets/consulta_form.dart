import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsultaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConsultaProvider>(context);
    return Form(
      key: provider.formConsultaKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: provider.state.modalidad,
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
            onChanged: (value) {
              final provider = Provider.of<ConsultaProvider>(context, listen: false);
              provider.modalidad = value;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            maxLength: 300,
            decoration: InputDecoration(
              hintText: 'Describe tus síntomas....',
            ),
            controller: provider.txtSintomasController,
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
