import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../Core/Errors/app_exceptions.dart';
import '../../../../../../../Domain/use_cases/brands_use_case.dart';
import 'brands_states.dart';

@injectable
class BrandsViewModel extends Cubit<BrandsStates> {
  BrandsUseCase brandsUseCase;

  BrandsViewModel({required this.brandsUseCase}) : super(BrandsInitialState());

  Future<void> getBrands() async {
    try {
      emit(BrandsLoadingState());

      var brandsList = await brandsUseCase.invoke();

      emit(BrandsSuccessState(brandsList: brandsList));
    } on AppException catch (e) {
      emit(BrandsErrorState(msg: e.ErrorMsg));
    } catch (e) {
      emit(BrandsErrorState(msg: e.toString()));
    }
  }
}
