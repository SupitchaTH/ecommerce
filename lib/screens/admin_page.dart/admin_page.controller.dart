import 'dart:developer';

import 'package:ecommerce/components/alert.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/services/db_service.dart';
import 'package:flutter/material.dart';

class AdminPageController extends ChangeNotifier {
  BuildContext context;
  AdminPageController(this.context);

  List<Product> productList = [];

  void getProductsList() async {
    productList = await DBServices.getProductList();
    log(productList.length.toString());
    notifyListeners();
  }

  void createProduct(Product product) async {
    await DBServices.createNewProduct(product);
    getProductsList();
  }

  void updateProducts(Product product) async {
    try {
      await DBServices.updateProduct(product);
      getProductsList();
    } catch (e) {
      Alert.showErrorAlert(context, err: e);
    }
  }

  Future<void> deleteProduct(Product product) async {
    try {
      await DBServices.deleteProduct(product);
      getProductsList();
    } catch (e) {
      Alert.showErrorAlert(context, err: e);
    }
  }
}
