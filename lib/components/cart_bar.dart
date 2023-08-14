// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/checkout/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBar extends StatefulWidget {
  const CartBar({super.key});

  @override
  State<CartBar> createState() => _CartBarState();
}

class _CartBarState extends State<CartBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, con, child) {
        return Container(
          height: 60,
          color: Colors.blue[300],
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.shopping_bag,
              ),
              Text(
                'x ${con.itemCount}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(),
                    ),
                  );
                },
                child: Text('Checkout'),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
