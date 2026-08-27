import '../get_cart/product.dart';

class CartProduct {
  final int count;

  final String id;

  final Product product;

  final int price;

  CartProduct({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });
}
