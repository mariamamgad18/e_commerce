import 'package:ecommerce/Domain/entities/response/product/product_data.dart';

abstract class ProductDetailsStates {}

class ProductDetailsInitialStates extends ProductDetailsStates {}

class ProductDetailsLoadingStates extends ProductDetailsStates {}

class ProductDetailsSuccessStates extends ProductDetailsStates {
  final ProductData Product;

  ProductDetailsSuccessStates({required this.Product});
}

class ProductDetailsErrorStates extends ProductDetailsStates {
  final String ErroMsg;

  ProductDetailsErrorStates({required this.ErroMsg});
}
