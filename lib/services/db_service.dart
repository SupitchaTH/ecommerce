import 'dart:developer';

import 'package:ecommerce/models/product.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBServices {
  static Isar? isar;
  static Future<void> initDB() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [ProductSchema],
        directory: dir.path,
      );
    } catch (e) {
      log('open isar');
      log(e.toString());
    }
  }

  static createNewProduct(Product newProduct) async {
    try {
      await isar?.writeTxn(() async {
        await isar?.collection<Product>().put(newProduct);
      });
      log('Add done');
    } catch (e) {
      throw {
        "code": 5000,
        "error_title": "create product",
        "error_msg": "Failed to Create product",
      };
    }
  }

  static Future<List<Product>> getProductList() async {
    try {
      final productlist =
          await isar?.collection<Product>().where().findAll() ?? [];
      return productlist;
    } catch (e) {
      log(e.toString());
      throw {
        "code": 5000,
        "error_title": "Get product",
        "error_msg": "Failed to Get product",
      };
    }
  }

  static Future<void> deleteProduct(Product product) async {
    try {
      await isar?.writeTxn(() async {
        await isar?.collection<Product>().delete(product.id);
      });
    } catch (e) {
      throw {
        "code": 5000,
        "error_title": "Delete Product",
        "error_msg": "Failed To Delete Product",
      };
    }
  }

  static updateProduct(Product newProduct) async {
    try {
      await isar?.writeTxn(() async {
        await isar?.collection<Product>().put(newProduct);
      });
      log('Add done');
    } catch (e) {
      throw {
        "code": 5000,
        "error_title": "Update product",
        "error_msg": "Failed to Update product",
      };
    }
  }
}
