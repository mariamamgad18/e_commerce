import 'package:ecommerce/Domain/entities/response/product/product_brand.dart';
import 'package:ecommerce/Domain/entities/response/product/product_category.dart';
import 'package:ecommerce/Domain/entities/response/product/product_sub_category.dart';

class ProductData {
  final int? sold;

  final List<String>? images;

  final List<ProductSubCategory>? subcategory;

  final int? ratingsQuantity;

  final String? id;

  final String? title;

  final String? slug;

  final String? description;

  final int? quantity;

  final int? price;

  final String? imageCover;

  final ProductCategory? category;

  final ProductBrand? brand;

  final num? ratingsAverage;

  final String? createdAt;

  final String? updatedAt;

  ProductData({
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
}
