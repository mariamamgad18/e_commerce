

class AddToCartResponse {
  final String status;

  final String message;

  final int numOfCartItems;

  final String cartId;

  AddToCartResponse({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
  });
}
