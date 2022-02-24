import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:woocommerce/woocommerce.dart';
import 'package:woocommerce_shop/data/repository.dart';

class ProductsProvider extends ChangeNotifier {
  final Repository _servise;
  ProductsProvider(this._servise);

  List<WooProductCategory> categories = [];
  List<WooProductCategory> categoriesWithoutPromo = [];
  late WooProductCategory promoCategory;
  late WooProductCategory categoryById;
  List<WooProduct> allProducts = [];
  List<WooProduct> categoryProducts = [];
  late WooProduct product;

  Future<void> getProductCategories() async {
    List<WooProductCategory> cat = [];
    cat = await _servise.getProductCategories(0);
    categories = cat.where((element) => element.count > 0).toList();
    categoriesWithoutPromo = categories.where((element) => element.name != "Акции").toList();
    promoCategory = cat.firstWhere((element) => element.name == "Акции");
    notifyListeners();
  }

  Future<void> getProductCategoryById(int categoryId) async {
    categoryById = await _servise.getProductCategoryById(categoryId);
    notifyListeners();
  }

  Future<void> getAllProducts() async {
    allProducts = await _servise.getAllProducts();
    notifyListeners();
  }

  Future<void> getProductsByCategoryId(String categoryId) async {
    categoryProducts = await _servise.getProductsByCategoryId(categoryId);
    notifyListeners();
  }

  Future<void> getProductById(int id) async {
    product = await _servise.getProductById(id);
    notifyListeners();
  }
}