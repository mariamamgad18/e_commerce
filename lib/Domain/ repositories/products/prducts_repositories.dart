import 'package:ecommerce/Domain/entities/response/product/product_data.dart';

abstract class PrductsRepositories {
  Future<List<ProductData>?> getAllProducts();
}
