import 'package:ecommerce/Data/data_sources/remote/categories/categories_remote_data_sources.dart';
import 'package:ecommerce/Domain/entities/response/category/category_data.dart';
import 'package:injectable/injectable.dart';

import '../../../Domain/ repositories/categories/categories_repository.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRemoteDataSources categoriesRemoteDataSources;

  CategoriesRepositoryImpl({required this.categoriesRemoteDataSources});

  @override
  Future<List<CategoryData>?> getAllCategories() {
    return categoriesRemoteDataSources.getAllCategories();
  }
}
