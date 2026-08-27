import 'package:ecommerce/Domain/entities/response/Brands/brand_data.dart';

abstract class BrandsRemoteDataSource {
  Future<List<BrandData>?> getAllBrands();
}
