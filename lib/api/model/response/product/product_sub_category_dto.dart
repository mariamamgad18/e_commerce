import 'package:json_annotation/json_annotation.dart';

part 'product_sub_category_dto.g.dart';

@JsonSerializable()
class ProductSubCategoryDto {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'category')
  final String? category;

  ProductSubCategoryDto({this.id, this.name, this.slug, this.category});

  factory ProductSubCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductSubCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSubCategoryDtoToJson(this);
}
