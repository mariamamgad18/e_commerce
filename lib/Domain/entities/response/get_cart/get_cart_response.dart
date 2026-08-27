import '../cart/cart_data.dart';

class GetCartResponse {
  final String status;

  final int numOfCartItems;

  final String cartId;

  final CartData data;

  GetCartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });
}
