import '../../Domain/entities/request/cart/add_to_cart_request.dart';
import '../model/request/cart/add_to_cart_request_dto.dart';

extension AddToCartRequestMapper on AddToCartRequest {
  AddToCartRequestDto toAddToCartRequestDto() {
    return AddToCartRequestDto(productId: productId);
  }
}
