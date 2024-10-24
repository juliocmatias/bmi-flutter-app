import 'package:bmiapp/pages/main_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController(text: 'email@email.com');
  var passwordController = TextEditingController(text: '123');

  final validEmailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  bool isValidEmail(String email) {
    return validEmailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 3;
  }

  bool validLogin(String email, String password) {
    return isValidEmail(email) && isValidPassword(password);
  }

  void navigatorPage() {
    if (validLogin(emailController.text, passwordController.text)) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
    } else {
      showAlertDialog('Erro Login', 'email ou senha invalido');
    }
  }

  void showAlertDialog(String tittle, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(tittle),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('Ok'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double columnWidth =
                constraints.maxWidth > 600 ? 400 : double.infinity;
            double padding = constraints.maxWidth > 600 ? 40.0 : 19.0;
            double paddingButton = constraints.maxWidth > 600 ? 70.0 : 19.0;

            return SingleChildScrollView(
              child: IntrinsicHeight(
                child: Center(
                  child: SizedBox(
                    width: columnWidth,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              flex: 12,
                              child: Image.asset('images/logo-imc.png'),
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(padding, 0, padding, 19),
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(padding, 0, padding, 19),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Senha",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              paddingButton, 0, paddingButton, 19),
                          child: SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {
                                navigatorPage();
                              },
                              child: const Text("Entrar"),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
