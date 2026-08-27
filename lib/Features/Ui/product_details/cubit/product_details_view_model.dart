import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../Domain/use_cases/product_details_use_case.dart';
import 'product_details_states.dart';

@Injectable()
class ProductDetailsViewModel extends Cubit<ProductDetailsStates> {
  final ProductDetailsUseCase productDetailsUseCase;

  ProductDetailsViewModel({required this.productDetailsUseCase})
    : super(ProductDetailsInitialStates());

  Future<void> getProductDetails(String id) async {
    emit(ProductDetailsLoadingStates());

    try {
      final product = await productDetailsUseCase.invoke(id);

      if (product != null) {
        emit(ProductDetailsSuccessStates(Product: product));
      } else {
        emit(ProductDetailsErrorStates(ErroMsg: "Product not found"));
      }
    } catch (e) {
      emit(ProductDetailsErrorStates(ErroMsg: e.toString()));
    }
  }
}
