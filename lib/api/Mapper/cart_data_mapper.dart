import 'package:ecommerce/Domain/entities/response/cart/cart_data.dart';

import '../model/response/cart/cart_data_dto.dart';
import 'cart_product_mapper.dart';

extension CartDataMapper on CartDataDto {
  CartData toCartData() {
    return CartData(
      id: id ?? '',
      cartOwner: cartOwner ?? '',

      products:
          products?.map((product) => product.toCartProduct()).toList() ?? [],

      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      v: v ?? 0,
      totalCartPrice: totalCartPrice ?? 0,
    );
  }
}
