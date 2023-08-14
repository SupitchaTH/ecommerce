// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/screens/main_menu/main_menu.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late MainMenuController controller;

  @override
  void initState() {
    controller = MainMenuController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainMenuController>(
      create: (context) => controller,
      child: Consumer<MainMenuController>(builder: (context, con, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Main Menu'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: con.goToAdmin,
                  child: Text('To Admin'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('To User'),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
