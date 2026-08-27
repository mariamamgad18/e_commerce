import 'package:ecommerce/Domain/entities/response/get_cart/subcategory.dart';

import 'brand.dart';
import 'category.dart';

class Product {
  final List<Subcategory> subcategory;

  final String id;

  final String title;

  final int quantity;

  final String imageCover;

  final Category category;

  final Brand brand;

  final double ratingsAverage;

  final String productId;

  Product({
    required this.subcategory,
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.productId,
  });
}
