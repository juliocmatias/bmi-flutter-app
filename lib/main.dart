import 'package:bmiapp/my_app.dart';
import 'package:bmiapp/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LoginStore(),
      child: const MyApp(),
    ),
  );
}
