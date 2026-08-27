import '../../entities/response/category/category_data.dart';

abstract class CategoriesRepository {
  //هخليه يرجه ليسته بس عشان دي اللي محتاجاها من الريسبونس
  Future<List<CategoryData>?> getAllCategories();
}
