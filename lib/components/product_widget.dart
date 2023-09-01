// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onDelete;
  final VoidCallback? onUpdate;
  final VoidCallback? onAddTocart;
  final bool isAdmin;
  const ProductWidget(
      {super.key,
      required this.product,
      this.isAdmin = false,
      this.onDelete,
      this.onUpdate,
      this.onAddTocart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 150,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Product:   ${product.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Detial:   ${product.description}')),
                Spacer(),
                Row(
                  children: [
                    Text('Price:'),
                    Spacer(),
                    Text(
                      product.price.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Visibility(
                  visible: isAdmin,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: onUpdate,
                        child: Text(
                          'update',
                          style: TextStyle(color: Colors.green[900]),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        child: IconButton(
                          onPressed: onDelete,
                          icon: Icon(Icons.delete),
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: !isAdmin,
                  child: TextButton(
                    onPressed: onAddTocart,
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
