import 'dart:ui';

import 'package:covid19_itc/src/ui/router.dart';
import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(children: [
        TableRow(children: [
          _CardButton(
            icon: Icons.text_snippet,
            text: 'Encuestas',
            color: Colors.blue,
            onTap: () => Navigator.pushNamed(context, Routes.listSurvey),
          ),
          _CardButton(icon: Icons.notification_important, text: 'Alertas', color: Colors.pink),
        ]),
        TableRow(children: [
          _CardButton(
            icon: Icons.science,
            text: 'Pruebas de Covid',
            color: Colors.green,
            onTap: () => Navigator.pushNamed(context, Routes.testsPage),
          ),
          _CardButton(icon: Icons.medical_services, text: 'Consultas', color: Colors.orange),
        ]),
      ]),
    );
  }
}

class _CardButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback? onTap;

  const _CardButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: _CardBackground(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: this.color,
              child: Icon(this.icon, size: 35, color: Colors.white),
              radius: 30,
            ),
            SizedBox(height: 20),
            Text(this.text, style: TextStyle(color: this.color, fontSize: 18))
          ],
        ),
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget widget;

  const _CardBackground({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(40, 80, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}
