import 'package:ecommerce/Domain/entities/response/Brands/brand_data.dart';

abstract class BrandsStates {}

class BrandsInitialState extends BrandsStates {}

class BrandsLoadingState extends BrandsStates {}

class BrandsSuccessState extends BrandsStates {
  List<BrandData>? brandsList;

  BrandsSuccessState({required this.brandsList});
}

class BrandsErrorState extends BrandsStates {
  String msg;

  BrandsErrorState({required this.msg});
}
