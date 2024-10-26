class User {
  final String _email;
  String get email => _email;

  final String _password;
  String get password => _password;

  User({required String email, required String password})
      : _email = email,
        _password = password;
}
