import 'package:json_annotation/json_annotation.dart';

import 'product_brand_dto.dart';
import 'product_category_dto.dart';
import 'product_sub_category_dto.dart';

part 'product_data_dto.g.dart';

@JsonSerializable()
class ProductDataDto {
  @JsonKey(name: 'sold')
  final int? sold;

  @JsonKey(name: 'images')
  final List<String>? images;

  @JsonKey(name: 'subcategory')
  final List<ProductSubCategoryDto>? subcategory;

  @JsonKey(name: 'ratingsQuantity')
  final int? ratingsQuantity;

  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'quantity')
  final int? quantity;

  @JsonKey(name: 'price')
  final int? price;

  @JsonKey(name: 'imageCover')
  final String? imageCover;

  @JsonKey(name: 'category')
  final ProductCategoryDto? category;

  @JsonKey(name: 'brand')
  final ProductBrandDto? brand;
  @JsonKey(name: 'ratingsAverage')
  final num? ratingsAverage;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  ProductDataDto({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDataDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataDtoToJson(this);
}
