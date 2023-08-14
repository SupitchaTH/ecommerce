// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:ecommerce/components/add_product_overlay.dart';
import 'package:ecommerce/components/alert.dart';
import 'package:ecommerce/components/edit_product.dart';
import 'package:ecommerce/components/product_widget.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/admin_page.dart/admin_page.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late AdminPageController controller;

  @override
  void initState() {
    controller = AdminPageController(context);
    controller.getProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdminPageController>(
      create: (context) => controller,
      child: Consumer<AdminPageController>(
        builder: (context, con, child) {
          return Scaffold(
            backgroundColor: Colors.purple[200],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddProductOverlay(
                      onSubmit: (p) {
                        con.createProduct(p);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.purple[200],
              centerTitle: true,
              title: Text('Admin Page'),
            ),
            body: ListView.builder(
              itemCount: con.productList.length,
              itemBuilder: (context, index) {
                return ProductWidget(
                  product: con.productList[index],
                  onDelete: () {
                    Alert.show(
                      context,
                      title: "Are u want to delete",
                      desc: "System will delete this data",
                      okText: "Delete",
                      okColor: Colors.red,
                      onOk: () {
                        con.deleteProduct(con.productList[index]);
                      },
                    );
                  },
                  onUpdate: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return EditProduct(
                          product: con.productList[index],
                          onEdit: (p) {
                            Product updated = con.productList[index];
                            updated
                              ..name = p.name
                              ..description = p.description
                              ..price = p.price;
                            con.updateProducts(updated);
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                  isAdmin: true,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
