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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Spacer(),
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(product.description),
                Spacer(),
                Text(
                  product.price.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Visibility(
                  visible: isAdmin,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: onUpdate,
                        child: Text('update'),
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
                    child: Text('Add to cart'),
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
