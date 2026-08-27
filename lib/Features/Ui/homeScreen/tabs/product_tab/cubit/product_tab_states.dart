import 'package:ecommerce/Domain/entities/response/product/product_data.dart';

abstract class ProductTabStates {}

class ProductTabInitialState extends ProductTabStates {}

class ProductTabLoadingState extends ProductTabStates {}

class ProductTabSuccessState extends ProductTabStates {
  List<ProductData>? productList;

  ProductTabSuccessState({required this.productList});
}

class ProductTabErrorState extends ProductTabStates {
  String ErrorMsg;

  ProductTabErrorState({required this.ErrorMsg});
}
