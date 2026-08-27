import 'package:ecommerce/Domain/entities/response/product/product_data.dart';
import 'package:injectable/injectable.dart';

import '../../../Domain/ repositories/products/prducts_repositories.dart';
import '../../data_sources/remote/products/product_remote_data_source.dart';

@Injectable(as: PrductsRepositories)
class PrductsRepositoriesImpl implements PrductsRepositories {
  ProductRemoteDataSource productRemoteDataSource;

  PrductsRepositoriesImpl({required this.productRemoteDataSource});

  @override
  Future<List<ProductData>?> getAllProducts() {
    return productRemoteDataSource.getAllProducts();
  }
}
