import '../../Domain/entities/response/cart/add_to_cart_response.dart';
import '../model/response/cart/add_to_cart_response_dto.dart';

extension AddToCartResponseMapper on AddToCartResponseDto {
  AddToCartResponse toAddToCartResponse() {
    return AddToCartResponse(
      status: status,
      message: message,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
    );
  }
}
