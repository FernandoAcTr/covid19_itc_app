import 'package:covid19_itc/src/data/providers/login/login_provider.dart';
import 'package:covid19_itc/src/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatelessWidget {
  final emailController = TextEditingController(text: 'fernando@gmail.com');
  final passwordController = TextEditingController(text: '123');

  @override
  Widget build(BuildContext context) {
    final card = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            _TextField(Icons.person_outline, 'Correo', false, emailController),
            SizedBox(height: 5.0),
            _TextField(Icons.lock_outline, 'Contraseña', true, passwordController),
            SizedBox(height: 20.0),
            SizedBox(height: 30.0),
            LoginButton(emailController: emailController, passwordController: passwordController),
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

class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LoginProvider>(context).state;
    return state.loading
        ? CircularProgressIndicator()
        : MaterialButton(
            minWidth: double.infinity,
            height: 50.0,
            child: Text('Login', style: TextStyle(fontSize: 20.0)),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () async {
              final login = await Provider.of<LoginProvider>(context, listen: false)
                  .login(emailController.text, passwordController.text);
              if (login) Navigator.pushReplacementNamed(context, Routes.home);
            },
          );
  }
}

class _TextField extends StatelessWidget {
  final IconData icon;
  final String prompt;
  final TextEditingController controller;
  final bool hideText;

  const _TextField(this.icon, this.prompt, this.hideText, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: hideText,
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
