import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covid19_itc/src/ui/router.dart';
import 'package:covid19_itc/src/ui/theme.dart';
import 'package:covid19_itc/src/ui/pages/pruebas/tests_page.dart';
import 'package:covid19_itc/src/ui/pages/encuestas/survey_page.dart';
import 'package:covid19_itc/src/ui/pages/home/home_page.dart';
import 'package:covid19_itc/src/ui/pages/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      title: 'Material App',
      initialRoute: Routes.login,
      theme: myTheme,
      routes: {
        Routes.login: (_) => LoginPage(),
        Routes.home: (_) => HomePage(),
        Routes.listSurvey: (_) => SurveyPage(),
        Routes.testsPage: (_) => TestsPage(),
      },
    );
  }
}
