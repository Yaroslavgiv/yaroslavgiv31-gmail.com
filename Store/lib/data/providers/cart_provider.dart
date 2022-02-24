import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:woocommerce/woocommerce.dart';

import 'package:woocommerce_shop/domain/cart_item.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> cartProducts = [];
  int totalSum = 0;

  void countTotalSum() {
    int sum = 0;
    for (var element in cartProducts) {
      sum += (int.parse(element.product.price) * element.quantity);
    }
    totalSum = sum;
  }

  void addProductToCart(WooProduct product, int quantity) {
    CartItem item = CartItem(
      product: product,
      quantity: quantity,
    );
    if (cartProducts.any((element) => element.product.id == product.id)) {
      cartProducts
          .firstWhere((element) => element.product.id == product.id)
          .quantity += quantity;
    } else {
      cartProducts.add(item);
    }
    countTotalSum();
    notifyListeners();
  }

  void removeProductFromCart(WooProduct product, int quantity) {
    CartItem item = CartItem(product: product, quantity: quantity);
    if (cartProducts.any((element) => element.product.id == product.id)) {
      CartItem sameItem = cartProducts
          .firstWhere((element) => element.product.id == product.id);
      sameItem.quantity -= quantity;
      if (sameItem.quantity == 0) {
        cartProducts.remove(sameItem);
      }
    } else {
      cartProducts.remove(item);
    }
    countTotalSum();
    notifyListeners();
  }
}
