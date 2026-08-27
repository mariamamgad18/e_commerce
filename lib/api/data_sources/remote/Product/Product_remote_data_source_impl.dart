import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../Core/Errors/app_exceptions.dart';
import '../../../../Data/data_sources/remote/products/product_remote_data_source.dart';
import '../../../../Domain/entities/response/product/product_data.dart';
import '../../../api_services.dart';
import '../../../mapper/product_mapper.dart';
import '../../../model/response/product/product_data_dto.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiServices apiServices;

  ProductRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<ProductData>?> getAllProducts() async {
    try {
      var productRes = await apiServices.getAllProducts();

      return productRes.data
              ?.map((ProductDataDto productDto) => productDto.toProductData())
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
