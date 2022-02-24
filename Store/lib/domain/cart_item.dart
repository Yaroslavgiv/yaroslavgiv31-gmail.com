// ignore: import_of_legacy_library_into_null_safe
import 'package:woocommerce/woocommerce.dart';

class CartItem {
  final WooProduct product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}
