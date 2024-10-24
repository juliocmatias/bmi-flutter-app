import 'package:bmiapp/widgets/menu_anchor_main.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 108,
                child: Image.asset(
                  'images/logo-imc.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const Text(
                'Calculadora IMC',
                style: TextStyle(color: Colors.white),
              ),
              const MenuAnchorMain()
            ],
          ),
        ),
        body: Container(),
      ),
    );
  }
}
