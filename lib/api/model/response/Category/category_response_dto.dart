import 'package:ecommerce/api/model/response/Category/category_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common/metadata_dto.dart';

part 'category_response_dto.g.dart';

@JsonSerializable()
class CategoryResponseDto {
  @JsonKey(name: 'results')
  final int? results;

  @JsonKey(name: 'metadata')
  final MetadataDto? metadata;

  @JsonKey(name: 'data')
  final List<CategoryDataDto>? data;

  CategoryResponseDto({this.results, this.metadata, this.data});

  factory CategoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseDtoToJson(this);
}
