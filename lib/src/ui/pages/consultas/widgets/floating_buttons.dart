import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:covid19_itc/src/data/providers/consulta/consulta_provider.dart';
import 'package:covid19_itc/src/ui/pages/consultas/constultas_page.dart';
import 'package:covid19_itc/src/ui/utils.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
          onTap: () async {
            final provider = Provider.of<ConsultaProvider>(context, listen: false);
            if (provider.state.evidencias.length == 3)
              return showSnackBar(text: 'Solamente puedes agregar un máximo de 3 evidencias', context: context);
            final file = await _showSelectionDialog(context);
            if (file != null) provider.addEvidence(file);
          },
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

  /// Get from gallery
  Future<File?> _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
  }

  /// Get from Camera
  Future<File?> _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
  }

  Future<File?> _showSelectionDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: new Wrap(
              children: [
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Galería'),
                    onTap: () async {
                      final file = await _getFromGallery();
                      Navigator.of(context).pop(file);
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Cámara'),
                  onTap: () async {
                    final file = await _getFromCamera();
                    Navigator.of(context).pop(file);
                  },
                ),
              ],
            ),
          );
        });
  }
}
