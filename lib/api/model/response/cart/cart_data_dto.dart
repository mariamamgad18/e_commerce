import 'package:json_annotation/json_annotation.dart';

import 'cart_product_dto.dart';

part 'cart_data_dto.g.dart';

@JsonSerializable()
class CartDataDto {
  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "cartOwner")
  final String? cartOwner;

  @JsonKey(name: "products")
  final List<CartProductDto>? products;

  @JsonKey(name: "createdAt")
  final String? createdAt;

  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  @JsonKey(name: "__v")
  final int? v;

  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  CartDataDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory CartDataDto.fromJson(Map<String, dynamic> json) =>
      _$CartDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataDtoToJson(this);
}
