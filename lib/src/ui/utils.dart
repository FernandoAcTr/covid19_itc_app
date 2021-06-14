import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar({required String text, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    action: SnackBarAction(label: 'Aceptar', onPressed: () {}),
  ));
}

Future<int?> showConfirmDialog(BuildContext context, {required String text}) async {
  return showDialog<int>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text('Confirmar'),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            child: Text('Confirmar'),
            onPressed: () => Navigator.of(context).pop(1),
          ),
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(0),
          ),
        ],
      );
    },
  );
}
