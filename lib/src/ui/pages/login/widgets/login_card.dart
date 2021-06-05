import 'package:covid19_itc/src/ui/router.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final card = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            _TextField(Icons.person_outline, 'Correo'),
            SizedBox(height: 5.0),
            _TextField(Icons.lock_outline, 'Contraseña'),
            SizedBox(height: 20.0),
            SizedBox(height: 30.0),
            MaterialButton(
                minWidth: double.infinity,
                height: 50.0,
                child: Text('Login', style: TextStyle(fontSize: 20.0)),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false)),
          ],
        ),
      ),
    );

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 25.0),
          child: card,
        ),
        _CircleAvatar(),
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  final IconData icon;
  final String prompt;

  const _TextField(this.icon, this.prompt);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: prompt,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        prefixIcon: Icon(icon),
      ),
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 33.0,
      child: Icon(Icons.person, size: 40.0, color: Colors.white),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
