import 'package:flutter/material.dart';

class ConsultaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Text('Estatus: Pendiente', style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Text('Fecha: '),
              SizedBox(height: 5),
              Text('Medico: '),
              SizedBox(height: 5),
              Text('Modalidad: Presencial'),
              SizedBox(height: 5),
              Text('Sintomas:'),
              Text('Aliquip exercitation ipsum adipisicing ad anim exercitation veniam consequat nostrud irure.'),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: Text('Eliminar'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
