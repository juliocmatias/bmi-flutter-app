import 'package:flutter/material.dart';

class CalculatorBmi extends StatefulWidget {
  const CalculatorBmi({super.key});

  @override
  State<CalculatorBmi> createState() => _CalculatorBmiState();
}

class _CalculatorBmiState extends State<CalculatorBmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calculadora IMC'),
      ),
      body: Container(),
    );
  }
}
