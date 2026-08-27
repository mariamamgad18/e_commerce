import 'package:ecommerce/Domain/entities/response/product/product_data.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductData>?> getAllProducts();
}
