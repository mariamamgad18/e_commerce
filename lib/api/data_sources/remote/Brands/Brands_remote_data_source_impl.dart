import 'package:dio/dio.dart';
import 'package:ecommerce/Data/data_sources/remote/Brands/brands_remote_data_source.dart';
import 'package:ecommerce/Domain/entities/response/Brands/brand_data.dart';
import 'package:ecommerce/api/Mapper/brand_mapper.dart';
import 'package:ecommerce/api/model/response/Brands/brand_data_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../Core/Errors/app_exceptions.dart';
import '../../../api_services.dart';

@Injectable(as: BrandsRemoteDataSource)
class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  ApiServices apiServices;

  BrandsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<BrandData>?> getAllBrands() async {
    try {
      var brandsRes = await apiServices.getAllBrands();
      // response >> dto
      //وانا عايزاه مش dto
      //todo: Convert  List<BrandDataDto>  >>    List<BrandData>
      return brandsRes.data
              ?.map((BrandDataDto brandDto) => brandDto.toBrandData())
              .toList() ??
          [];
    } on DioException catch (e) {
      throw ServerError(
        ErrorMsg:
            e.response?.data["message"]?.toString() ??
            e.message ??
            "Unknown Error",
      );
    }
  }
}
