import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu de navegación',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            SizedBox(
              child: Text(
                'Navega entre tus encuestas, alertas, pruebas de covid o agenda una consulta con un médico',
                style: TextStyle(color: Colors.white),
              ),
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
