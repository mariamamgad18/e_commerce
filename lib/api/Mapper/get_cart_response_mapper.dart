import 'package:ecommerce/Domain/entities/response/cart/cart_data.dart';
import 'package:ecommerce/Domain/entities/response/get_cart/get_cart_response.dart';

import '../model/response/cart/get_cart/get_cart_response_dto.dart';
import 'cart_data_mapper.dart';

extension GetCartResponseMapper on GetCartResponseDto {
  GetCartResponse toGetCartResponse() {
    return GetCartResponse(
      status: status ?? '',
      numOfCartItems: numOfCartItems ?? 0,
      cartId: cartId ?? '',

      data:
          data?.toCartData() ??
          CartData(
            id: '',
            cartOwner: '',
            products: [],
            createdAt: '',
            updatedAt: '',
            v: 0,
            totalCartPrice: 0,
          ),
    );
  }
}
