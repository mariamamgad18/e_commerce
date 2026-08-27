import 'package:json_annotation/json_annotation.dart';

part 'product_brand_dto.g.dart';

@JsonSerializable()
class ProductBrandDto {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'image')
  final String? image;

  ProductBrandDto({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory ProductBrandDto.fromJson(Map<String, dynamic> json) =>
      _$ProductBrandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBrandDtoToJson(this);
}