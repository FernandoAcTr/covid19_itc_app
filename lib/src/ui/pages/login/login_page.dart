import 'package:flutter/material.dart';
import 'package:covid19_itc/src/ui/pages/login/widgets/login_card.dart';
import 'package:covid19_itc/src/ui/pages/login/widgets/title.dart';
import 'package:covid19_itc/src/ui/pages/login/widgets/background.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Background(),
          _Body(),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTitle(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginCard(),
        )
      ],
    );
  }
}
