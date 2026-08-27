import 'package:json_annotation/json_annotation.dart';

part 'brand_data_dto.g.dart';

@JsonSerializable()
class BrandDataDto {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  BrandDataDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandDataDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDataDtoToJson(this);
}
