import 'package:json_annotation/json_annotation.dart';

import 'brand_dto.dart';
import 'category_dto.dart';
import 'subcategory_dto.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  final List<SubcategoryDto>? subcategory;

  @JsonKey(name: "_id")
  final String? id;

  final String? title;

  final int? quantity;

  final String? imageCover;

  final CategoryDto? category;

  final BrandDto? brand;

  final double? ratingsAverage;

  @JsonKey(name: "id")
  final String? productId;

  ProductDto({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.productId,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
