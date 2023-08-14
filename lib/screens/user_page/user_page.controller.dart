import 'dart:developer';

import 'package:ecommerce/components/alert.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/services/db_service.dart';
import 'package:flutter/material.dart';

class UserPageController extends ChangeNotifier {
  BuildContext context;
  UserPageController(this.context);

  List<Product> productList = [];

  void onLoad() {
    getProductsList();
  }

  Future<void> getProductsList() async {
    try {
      productList = await DBServices.getProductList();
      notifyListeners();
    } catch (e) {
      Alert.showErrorAlert(context, err: e);
    }
  }
}
