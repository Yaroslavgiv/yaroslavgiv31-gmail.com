import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:woocommerce/woocommerce.dart';

// class RepositoryStorage {
//   List<WooProductCategory> categories = [];
//   List<WooProduct> allProducts = [];
// // List<WooProduct> categoryProducts = [];
// }

class Repository {
  // final RepositoryStorage _storage;
  //
  // Repository(this._storage);

  WooCommerce woocommerce = WooCommerce(
    baseUrl: "http://testsite.spb.ru",
    consumerKey: "ck_14d85bbf59043d22afa59e1915f1f5ea37c33399",
    consumerSecret: "cs_8a0621240781b57bd0047e5acddf835b027b26bc",
  );

  Future<List<WooProductCategory>> getProductCategories(int parentId) async {
    // if (_storage.categories.isEmpty) {
    //   _storage.categories = await woocommerce.getProductCategories(parent: parentId);
    // }
    return await woocommerce.getProductCategories(parent: parentId);
  }

  Future<WooProductCategory> getProductCategoryById(int categoryId) async {
    // WooProductCategory productCategoryById =
    //     await woocommerce.getProductCategoryById(categoryId: categoryId);
    return await woocommerce.getProductCategoryById(categoryId: categoryId);
  }

  Future<List<WooProduct>> getAllProducts() async {
    // if (_storage.allProducts.isEmpty) {
    //   _storage.allProducts = await woocommerce.getProducts();
    // }
    return await woocommerce.getProducts();
  }

  Future<List<WooProduct>> getProductsByCategoryId(String categoryId) async {
    // List<WooProduct> productsByCategoryId =
    //     await woocommerce.getProducts(category: categoryId);
    return await woocommerce.getProducts(category: categoryId);
  }

  Future<WooProduct> getProductById(int id) async {
    // WooProduct product = await woocommerce.getProductById(id: id);
    return await woocommerce.getProductById(id: id);
  }
}
