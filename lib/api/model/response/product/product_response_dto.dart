import 'package:json_annotation/json_annotation.dart';

import '../common/metadata_dto.dart';
import 'product_data_dto.dart';

part 'product_response_dto.g.dart';

@JsonSerializable()
class ProductResponseDto {
  @JsonKey(name: 'results')
  final int? results;

  @JsonKey(name: 'metadata')
  final MetadataDto? metadata;

  @JsonKey(name: 'data')
  final List<ProductDataDto>? data;

  ProductResponseDto({this.results, this.metadata, this.data});

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseDtoToJson(this);
}
