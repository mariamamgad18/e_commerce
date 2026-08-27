import 'package:json_annotation/json_annotation.dart';

import 'get_cart/product_dto.dart';

part 'cart_product_dto.g.dart';

@JsonSerializable()
class CartProductDto {
  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'product')
  final ProductDto product;

  @JsonKey(name: 'price')
  final int price;

  CartProductDto({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductDtoToJson(this);
}
