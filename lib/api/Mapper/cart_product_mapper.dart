import 'package:ecommerce/Domain/entities/response/cart/cart_product.dart';

import '../model/response/cart/cart_product_dto.dart';
import 'add_cart_product_mapper.dart';

extension CartProductMapper on CartProductDto {
  CartProduct toCartProduct() {
    return CartProduct(
      count: count,
      id: id,
      product: product.toProduct(),
      price: price,
    );
  }
}
