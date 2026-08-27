import 'package:dio/dio.dart';
import 'package:ecommerce/Core/Errors/app_exceptions.dart';
import 'package:ecommerce/Domain/entities/response/category/category_data.dart';
import 'package:ecommerce/api/Mapper/category_mapper.dart';
import 'package:ecommerce/api/api_services.dart';
import 'package:ecommerce/api/model/response/Category/category_data_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../Data/data_sources/remote/categories/categories_remote_data_sources.dart';

@Injectable(as: CategoriesRemoteDataSources)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSources {
  ApiServices apiServices;

  CategoriesRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<CategoryData>?> getAllCategories() async {
    try {
      var categoriesRes = await apiServices.getAllCategories();
      // response >> dto
      //وانا عايزاه مش dto
      //todo: Convert  List<CategoryDataDto>  >>    List<CategoryData>
      return categoriesRes.data
              ?.map((CategoryDataDto catDto) => catDto.ToCategoryDataDto())
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
