import 'package:ecommerce/components/cart_bar.dart';
import 'package:ecommerce/components/product_widget.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/user_page/user_page.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserPageController controller;
  late CartProvider cartProvider;

  @override
  void initState() {
    controller = UserPageController(context);

    controller.onLoad();
    cartProvider = Provider.of(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserPageController>(
      create: (context) => controller,
      child: Consumer<UserPageController>(
        builder: (context, con, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("User Page"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: con.productList.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        product: con.productList[index],
                        onAddTocart: () =>
                            cartProvider.addItem(con.productList[index]),
                      );
                    },
                  ),
                ),
                CartBar()
              ],
            ),
          );
        },
      ),
    );
  }
}
