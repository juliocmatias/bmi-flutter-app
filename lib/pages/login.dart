import 'package:bmiapp/pages/main_page.dart';
import 'package:bmiapp/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController(text: 'email@email.com');
  var passwordController = TextEditingController(text: '123');

  void navigatorPage() async {
    final store = context.read<LoginStore>();

    await store.logging(emailController.text, passwordController.text);

    if (mounted) {
      if (store.state.erro.isEmpty && !store.state.isLoading) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
      } else if (store.state.erro.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showAlertDialog('Erro no Login', store.state.erro);
          store.clearError();
        });
      }
    }
  }

  void showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.6),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(message, style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('Ok', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        body: Consumer<LoginStore>(
          builder: (context, store, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                double columnWidth =
                    constraints.maxWidth > 600 ? 400 : double.infinity;
                double padding = constraints.maxWidth > 600 ? 40.0 : 19.0;
                double paddingButton = constraints.maxWidth > 600 ? 70.0 : 19.0;

                if (store.state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

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
                              padding:
                                  EdgeInsets.fromLTRB(padding, 0, padding, 19),
                              child: TextField(
                                controller: emailController,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Email",
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(padding, 0, padding, 19),
                              child: TextField(
                                obscureText: true,
                                controller: passwordController,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
            );
          },
        ),
      ),
    );
  }
}
