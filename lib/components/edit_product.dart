// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:ecommerce/models/product.dart';

import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  final Function(Product)? onEdit;
  final Product product;

  const EditProduct({
    super.key,
    this.onEdit,
    required this.product,
  });

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  late TextEditingController nameCtrl;
  late TextEditingController dscCtrl;
  late TextEditingController priceCtrl;

  InputDecoration textFieldDeco = InputDecoration(
      border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  ));

  @override
  void initState() {
    nameCtrl = TextEditingController(text: widget.product.name);
    dscCtrl = TextEditingController(text: widget.product.description);
    priceCtrl = TextEditingController(text: widget.product.price.toString());
    log('show EditOverlay');
    super.initState();
  }

  @override
  void dispose() {
    log('close EditOverlay');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Edit product',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Name of product :'),
              ),
            ),
            Flexible(
              child: TextFormField(
                controller: nameCtrl,
                decoration: textFieldDeco,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Description of product :'),
              ),
            ),
            Flexible(
              child: TextFormField(
                controller: dscCtrl,
                decoration: textFieldDeco,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Price :'),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    controller: priceCtrl,
                    decoration: textFieldDeco,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (widget.onEdit != null) {
                          widget.onEdit!(
                            Product(
                              name: nameCtrl.text,
                              description: dscCtrl.text,
                              price: double.parse(priceCtrl.text),
                            ),
                          );
                        } else {
                          return;
                        }
                      },
                      child: Text('Update to store'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
