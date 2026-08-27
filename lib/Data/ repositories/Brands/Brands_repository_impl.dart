import 'package:ecommerce/Domain/entities/response/Brands/brand_data.dart';
import 'package:injectable/injectable.dart';

import '../../../Domain/ repositories/brands/brands_repository.dart';
import '../../data_sources/remote/Brands/brands_remote_data_source.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository {
  BrandsRemoteDataSource brandsRemoteDataSource;

  BrandsRepositoryImpl({required this.brandsRemoteDataSource});

  @override
  Future<List<BrandData>?> getAllBrands() {
    return brandsRemoteDataSource.getAllBrands();
  }
}
