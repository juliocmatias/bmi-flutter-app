import 'package:bmiapp/pages/login.dart';
import 'package:bmiapp/stores/people_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuAnchorMain extends StatelessWidget {
  final PageController pageController;
  MenuAnchorMain({super.key, required this.pageController});
  final MenuController _menuController = MenuController();

  void toggleMenu() {
    if (_menuController.isOpen) {
      _menuController.close();
    } else {
      _menuController.open();
    }
  }

  @override
  Widget build(BuildContext context) {
    final peopleRegistered = context.read<PeopleStore>();

    return MenuAnchor(
      controller: _menuController,
      style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.inversePrimary)),
      alignmentOffset: const Offset(0, 4),
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Perfil',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.person,
                color: Colors.white,
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
        MenuItemButton(
          onPressed: () {
            peopleRegistered.state.people.clear();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Sair',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.login_outlined,
                color: Colors.white,
              )
            ],
          ),
        )
      ],
      child: IconButton(
          onPressed: () {
            toggleMenu();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          )),
    );
  }
}
