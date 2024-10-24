import 'package:bmiapp/pages/login.dart';
import 'package:bmiapp/pages/profile.dart';
import 'package:flutter/material.dart';

class MenuAnchorMain extends StatefulWidget {
  const MenuAnchorMain({super.key});

  @override
  State<MenuAnchorMain> createState() => _MenuAnchorMainState();
}

class _MenuAnchorMainState extends State<MenuAnchorMain> {
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
    return MenuAnchor(
      controller: _menuController,
      style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.inversePrimary)),
      alignmentOffset: const Offset(0, 4),
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
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
