import 'package:ecommerce/Domain/%20repositories/brands/brands_repository.dart';
import 'package:ecommerce/Domain/entities/response/Brands/brand_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsUseCase {
  BrandsRepository brandsRepository;

  BrandsUseCase({required this.brandsRepository});

  Future<List<BrandData>?> invoke() {
    return brandsRepository.getAllBrands();
  }
}
