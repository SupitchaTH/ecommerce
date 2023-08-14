// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/services/db_service.dart';
import 'package:flutter/material.dart';

class AddProductOverlay extends StatefulWidget {
  final Function(Product)? onSubmit;

  const AddProductOverlay({
    super.key,
    this.onSubmit,
  });

  @override
  State<AddProductOverlay> createState() => _AddProductOverlayState();
}

class _AddProductOverlayState extends State<AddProductOverlay> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController dscCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();

  InputDecoration textFieldDeco = InputDecoration(border: OutlineInputBorder());

  @override
  void initState() {
    log('show overlay');
    super.initState();
  }

  @override
  void dispose() {
    log('close overlay');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            Spacer(),
            Flexible(
              child: TextFormField(
                controller: nameCtrl,
                decoration: textFieldDeco,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: TextFormField(
                controller: dscCtrl,
                decoration: textFieldDeco,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
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
                      onPressed: () async {
                        if (widget.onSubmit != null) {
                          widget.onSubmit!(
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
                      child: Text('Add to store'),
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
