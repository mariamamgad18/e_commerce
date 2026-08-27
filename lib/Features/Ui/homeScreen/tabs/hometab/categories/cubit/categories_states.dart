import 'package:ecommerce/Domain/entities/response/category/category_data.dart';

abstract class CategoriesStates {}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
  List<CategoryData>? categoriesList;

  CategoriesSuccessState({required this.categoriesList});
}

class CategoriesErrorState extends CategoriesStates {
  String msg;

  CategoriesErrorState({required this.msg});
}
