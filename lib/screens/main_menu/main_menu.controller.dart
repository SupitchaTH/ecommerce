import 'package:ecommerce/screens/admin_page.dart/admin_page.dart';
import 'package:flutter/material.dart';

class MainMenuController extends ChangeNotifier {
  BuildContext context;
  MainMenuController(this.context);

  void goToAdmin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AdminPage()));
  }
}
