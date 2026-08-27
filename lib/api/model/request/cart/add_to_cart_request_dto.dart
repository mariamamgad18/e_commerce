import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request_dto.g.dart';

@JsonSerializable()
class AddToCartRequestDto {
  @JsonKey(name: "productId")
  final String productId;

  AddToCartRequestDto({required this.productId});

  factory AddToCartRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddToCartRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartRequestDtoToJson(this);
}
