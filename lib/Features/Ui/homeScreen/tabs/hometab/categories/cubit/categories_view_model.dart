import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../Core/Errors/app_exceptions.dart';
import '../../../../../../../Domain/use_cases/categories_use_case.dart';
import 'categories_states.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesStates> {
  CategoriesUseCase categoriesUseCase;

  CategoriesViewModel({required this.categoriesUseCase})
    : super(CategoriesInitialState());

  Future<void> getCategories() async {
    try {
      emit(CategoriesLoadingState());

      var categoriesList = await categoriesUseCase.invoke();

      emit(CategoriesSuccessState(categoriesList: categoriesList));
    } on AppException catch (e) {
      emit(CategoriesErrorState(msg: e.ErrorMsg));
    } catch (e) {
      emit(CategoriesErrorState(msg: e.toString()));
    }
  }
}
