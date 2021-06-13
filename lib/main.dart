import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:covid19_itc/src/data/providers/login/login_provider.dart';
import 'package:covid19_itc/src/data/providers/prueba/prueba_provider.dart';
import 'package:covid19_itc/src/device/shared_prefs.dart';
import 'package:provider/provider.dart';
import 'package:covid19_itc/src/data/providers/encuesta/encuesta_provider.dart';
import 'package:covid19_itc/src/ui/router.dart';
import 'package:covid19_itc/src/ui/theme.dart';
import 'package:covid19_itc/src/ui/pages/pruebas/tests_page.dart';
import 'package:covid19_itc/src/ui/pages/encuestas/survey_page.dart';
import 'package:covid19_itc/src/ui/pages/home/home_page.dart';
import 'package:covid19_itc/src/ui/pages/login/login_page.dart';
import 'package:covid19_itc/src/ui/pages/alerts/alerts_page.dart';
import 'package:covid19_itc/src/ui/pages/consultas/constultas_page.dart';

void main() async {
  //default locale
  await initializeDateFormatting('es_MX', null);
  Intl.defaultLocale = 'es_MX';

  //preferencias de usuario
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new SharedPrefs();
  await prefs.initPrefs();

  runApp(AppProvider());
}

class AppProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      title: 'Material App',
      initialRoute: Provider.of<LoginProvider>(context, listen: false).state.loggedIn ? Routes.home : Routes.login,
      theme: myTheme,
      routes: {
        Routes.login: (_) => LoginPage(),
        Routes.home: (_) => HomePage(),
        Routes.listSurvey: (_) => SurveyPage(),
        Routes.testsPage: (_) => TestsPage(),
        Routes.alertsPage: (_) => AlertsPage(),
        Routes.consultasPage: (_) => ConsultasPage(),
      },
    );
  }
}
