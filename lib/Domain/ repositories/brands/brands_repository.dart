import 'package:ecommerce/Domain/entities/response/Brands/brand_data.dart';

abstract class BrandsRepository {
  Future<List<BrandData>?> getAllBrands();
}
