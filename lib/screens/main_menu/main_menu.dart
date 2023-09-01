// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/screens/main_menu/main_menu.controller.dart';
import 'package:ecommerce/screens/user_page/user_page.dart';
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
            backgroundColor: Colors.green[900],
            title: Text('Main Menu'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: con.goToAdmin,
                    child: Text('Admin'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserPage()));
                    },
                    child: Text('User'),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
