import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar({required String text, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    action: SnackBarAction(label: 'Aceptar', onPressed: () {}),
  ));
}
