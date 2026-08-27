import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response_dto.g.dart';

@JsonSerializable()
class AddToCartResponseDto {
  @JsonKey(name: "status")
  final String status;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "numOfCartItems")
  final int numOfCartItems;

  @JsonKey(name: "cartId")
  final String cartId;

  AddToCartResponseDto({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
  });

  factory AddToCartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseDtoToJson(this);
}
