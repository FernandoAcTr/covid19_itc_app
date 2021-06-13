import 'package:covid19_itc/src/data/entities/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final _singletown = SharedPrefs._();
  late SharedPreferences _prefs;

  factory SharedPrefs() {
    return _singletown;
  }

  SharedPrefs._();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // usuario
  Usuario? get usuario {
    final jsonUser = _prefs.getString('usuario');
    return jsonUser != null ? Usuario.fromJson(jsonUser) : null;
  }

  set usuario(Usuario? usuario) {
    if (usuario != null)
      _prefs.setString('usuario', usuario.toJson());
    else
      _prefs.remove('usuario');
  }
}
