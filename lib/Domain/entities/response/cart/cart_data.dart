import 'cart_product.dart';

class CartData {
  final String id;

  final String cartOwner;

  final List<CartProduct> products;

  final String createdAt;

  final String updatedAt;

  final int v;

  final int totalCartPrice;

  CartData({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });
}
