import 'package:bloc/bloc.dart';
import 'package:ecommerce/Domain/use_cases/product_use_case.dart';
import 'package:ecommerce/Features/Ui/homeScreen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../Core/Errors/app_exceptions.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  ProductUseCase productUseCase;

  ProductTabViewModel({required this.productUseCase})
    : super(ProductTabInitialState());

  Future<void> getProducts() async {
    try {
      emit(ProductTabLoadingState());

      var productsList = await productUseCase.invoke();

      emit(ProductTabSuccessState(productList: productsList));
    } on AppException catch (e) {
      emit(ProductTabErrorState(ErrorMsg: e.ErrorMsg));
    } catch (e) {
      emit(ProductTabErrorState(ErrorMsg: e.toString()));
    }
  }
}
