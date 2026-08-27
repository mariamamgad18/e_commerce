import 'package:ecommerce/Domain/%20repositories/products/prducts_repositories.dart';
import 'package:ecommerce/Domain/entities/response/product/product_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUseCase {
  PrductsRepositories prductsRepositories;

  ProductUseCase({required this.prductsRepositories});

  Future<List<ProductData>?> invoke() {
    return prductsRepositories.getAllProducts();
  }
}
