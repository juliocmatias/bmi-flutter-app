import 'package:bmiapp/pages/login.dart';
import 'package:bmiapp/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final loginStore = context.watch<LoginStore>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          title: Center(
            child: Text('Profile',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 30)),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  loginStore.state.user.email,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                    width: 100,
                    child: FilledButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text('Sair'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
