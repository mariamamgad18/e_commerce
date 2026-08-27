import 'package:json_annotation/json_annotation.dart';

import '../common/metadata_dto.dart';
import 'brand_data_dto.dart';

part 'brand_response_dto.g.dart';

@JsonSerializable()
class BrandsResponseDto {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final MetadataDto? metadata;

  @JsonKey(name: 'data')
  final List<BrandDataDto>? data;

  BrandsResponseDto({this.results, this.metadata, this.data});

  factory BrandsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BrandsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsResponseDtoToJson(this);
}
