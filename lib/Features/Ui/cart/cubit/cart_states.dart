import '../../../../Domain/entities/response/cart/cart_data.dart';

abstract class CartStates {}

// =========================
// INITIAL
// =========================

class CartInitialState extends CartStates {}

// =========================
// GENERAL LOADING
// =========================

class CartLoadingState extends CartStates {}

// =========================
// GENERAL ERROR
// =========================

class CartErrorState extends CartStates {
  final String errorMsg;

  CartErrorState({required this.errorMsg});
}

// =========================
// ADD TO CART SUCCESS
// =========================

class AddCartSuccessState extends CartStates {
  final int numberOfItems;

  AddCartSuccessState({required this.numberOfItems});
}

// =========================
// GET CART SUCCESS
// =========================

class GetCartSuccessState extends CartStates {
  final CartData response;
  final int numberOfItems;

  GetCartSuccessState({required this.response, required this.numberOfItems});
}

// =========================
// DELETE LOADING
// =========================

class DeleteCartLoadingState extends CartStates {}

// =========================
// DELETE SUCCESS
// =========================

class DeleteCartSuccessState extends CartStates {
  final CartData response;
  final int numberOfItems;

  DeleteCartSuccessState({required this.response, required this.numberOfItems});
}

// =========================
// DELETE ERROR
// =========================

class DeleteCartErrorState extends CartStates {
  final String errorMsg;

  DeleteCartErrorState({required this.errorMsg});
}

// =========================
// UPDATE LOADING
// =========================

class UpdateCartLoadingState extends CartStates {}

// =========================
// UPDATE SUCCESS
// =========================

class UpdateCartSuccessState extends CartStates {
  final CartData response;
  final int numberOfItems;

  UpdateCartSuccessState({required this.response, required this.numberOfItems});
}

// =========================
// UPDATE ERROR
// =========================

class UpdateCartErrorState extends CartStates {
  final String errorMsg;

  UpdateCartErrorState({required this.errorMsg});
}
