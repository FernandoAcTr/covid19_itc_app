import 'package:covid19_itc/src/data/entities/usuario.dart';
import 'package:covid19_itc/src/device/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:covid19_itc/src/data/changenotifier_with_state.dart';
import 'package:covid19_itc/src/data/keys.dart';
import 'package:covid19_itc/src/data/providers/login/login_state.dart';

class LoginProvider extends ChangeNotifierWithState<LoginState> {
  late final SharedPrefs prefs;

  LoginProvider() {
    prefs = SharedPrefs();
    setState(LoginState(
      loggedIn: _isLoggedin(),
      loading: false,
    ));
  }

  Future<bool> login(String email, String password) async {
    setState(state.copyWith(loading: true));
    var success = false;
    final url = BASE_URL + '/usuarios/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final user = Usuario.fromJson(response.body);
        prefs.usuario = user;
        success = true;
      }
    } catch (e) {
      print(e);
    }
    setState(state.copyWith(loading: false, loggedIn: success));
    return success;
  }

  logout() {
    prefs.usuario = null;
    setState(state.copyWith(loggedIn: false));
  }

  bool _isLoggedin() {
    final usuario = prefs.usuario;
    return usuario != null;
  }
}
