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
          color: Colors.green[900],
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
              Text(
                'x ${con.itemCount}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(),
                    ),
                  );
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(
                      color: Colors.green[900], fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
