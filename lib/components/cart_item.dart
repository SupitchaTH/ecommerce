// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final VoidCallback? ondelete;
  const CartItem({super.key, required this.product, this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text("${product.name}"),
            Spacer(),
            Text("${product.price}"),
            GestureDetector(
              onTap: ondelete,
              child: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
