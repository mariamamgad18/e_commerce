import 'package:injectable/injectable.dart';

import '../ repositories/categories/categories_repository.dart';
import '../entities/response/category/category_data.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepository categoriesRepository;

  CategoriesUseCase({required this.categoriesRepository});

  Future<List<CategoryData>?> invoke() {
    return categoriesRepository.getAllCategories();
  }
}
