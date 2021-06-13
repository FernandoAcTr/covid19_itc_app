import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool loggedIn;
  final bool loading;

  LoginState({
    required this.loggedIn,
    required this.loading,
  });

  @override
  List<Object?> get props => [this.loggedIn, this.loading];

  @override
  bool? get stringify => true;

  LoginState copyWith({
    bool? loggedIn,
    bool? loading,
  }) =>
      LoginState(
        loggedIn: loggedIn ?? this.loggedIn,
        loading: loading ?? this.loading,
      );
}
