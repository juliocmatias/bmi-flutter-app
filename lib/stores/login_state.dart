// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmiapp/models/user.dart';

class LoginState {
  final bool isLoading;
  final String erro;
  final User user;

  LoginState({required this.isLoading, required this.erro, required this.user});

  factory LoginState.empty() {
    return LoginState(
        isLoading: false, erro: '', user: User(email: '', password: ''));
  }

  LoginState copyWith({
    bool? isLoading,
    String? erro,
    User? user,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      erro: erro ?? this.erro,
      user: user ?? this.user,
    );
  }
}
