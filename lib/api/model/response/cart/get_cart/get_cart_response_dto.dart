import 'package:json_annotation/json_annotation.dart';

import '../cart_data_dto.dart';

part 'get_cart_response_dto.g.dart';

@JsonSerializable()
class GetCartResponseDto {
  final String? status;

  final int? numOfCartItems;

  final String? cartId;

  final CartDataDto? data;

  GetCartResponseDto({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory GetCartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartResponseDtoToJson(this);
}
