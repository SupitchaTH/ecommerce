import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/main_menu/main_menu.dart';
import 'package:ecommerce/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBServices.initDB();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CartProvider>(
              create: ((context) => CartProvider()))
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainMenu(),
        ));
  }
}
