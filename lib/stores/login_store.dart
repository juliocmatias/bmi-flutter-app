import 'package:bmiapp/models/user.dart';
import 'package:bmiapp/stores/login_state.dart';
import 'package:flutter/material.dart';

class LoginStore extends ChangeNotifier {
  LoginState _state = LoginState.empty();
  LoginState get state => _state;

  final _validEmailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  bool _isValidEmail(String email) {
    return _validEmailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 3;
  }

  bool _validLogin(String email, String password) {
    return _isValidEmail(email) && _isValidPassword(password);
  }

  logging(String email, String password) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (_validLogin(email, password)) {
      _state = state.copyWith(
          erro: '',
          isLoading: false,
          user: User(
            email: email,
            password: password,
          ));
      notifyListeners();
    } else {
      _state =
          state.copyWith(erro: 'email ou senha inválidos', isLoading: false);
      notifyListeners();
    }
  }

  clearError() {
    _state = state.copyWith(erro: '');
  }
}
