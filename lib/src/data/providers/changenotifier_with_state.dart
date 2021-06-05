import 'package:flutter/cupertino.dart';

abstract class ChangeNotifierWithState<S> with ChangeNotifier {
  late S _state;

  S get state => _state;

  void setState(S nextState, [bool notify = true]) {
    _state = nextState;
    print('$runtimeType: currentState: $state');
    if (notify) notifyListeners();
  }
}
