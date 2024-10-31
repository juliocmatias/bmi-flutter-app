import 'package:bmiapp/pages/main_page_view.dart';
import 'package:bmiapp/pages/person_register.dart';
import 'package:bmiapp/pages/profile.dart';
import 'package:bmiapp/widgets/menu_anchor_main.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 1);

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
              MenuAnchorMain(
                pageController: pageController,
              )
            ],
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [
            PersonRegister(
              pageController: pageController,
            ),
            const MainPageView(),
            const Profile()
          ],
        ),
      ),
    );
  }
}
