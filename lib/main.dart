import 'package:bmiapp/my_app.dart';
import 'package:bmiapp/stores/login_store.dart';
import 'package:bmiapp/stores/people_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginStore()),
        ChangeNotifierProvider(create: (_) => PeopleStore()),
      ],
      child: const MyApp(),
    ),
  );
}
