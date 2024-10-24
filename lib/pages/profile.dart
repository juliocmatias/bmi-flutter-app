import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(
            child: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
