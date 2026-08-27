import '../../../../Domain/entities/response/category/category_data.dart';

abstract class CategoriesRemoteDataSources {
  Future<List<CategoryData>?> getAllCategories();
}
