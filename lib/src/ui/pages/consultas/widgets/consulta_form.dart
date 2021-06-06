import 'package:flutter/material.dart';

class ConsultaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            value: null,
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
            onChanged: (value) {},
          ),
          SizedBox(height: 15),
          TextFormField(
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Describe tus síntomas....',
              counterText: '0/300',
            ),
          ),
        ],
      ),
    );
  }
}
