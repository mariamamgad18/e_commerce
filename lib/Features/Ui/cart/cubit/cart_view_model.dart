import 'package:dio/dio.dart';
import 'package:ecommerce/Core/Errors/app_exceptions.dart';
import 'package:ecommerce/Core/cache/shared_pref_utils.dart';
import 'package:ecommerce/Domain/entities/request/cart/add_to_cart_request.dart';
import 'package:ecommerce/Domain/entities/response/cart/cart_product.dart';
import 'package:ecommerce/Domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce/Domain/use_cases/get_cart_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../Domain/use_cases/delete_items_use_case.dart';
import '../../../../Domain/use_cases/update_items_use_case.dart';
import 'cart_states.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final DeleteItemsUseCase deleteItemsUseCase;
  final UpdateItemsUseCase updateItemsUseCase;

  CartViewModel({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.deleteItemsUseCase,
    required this.updateItemsUseCase,
  }) : super(CartInitialState());

  static CartViewModel get(BuildContext context) {
    return BlocProvider.of<CartViewModel>(context);
  }

  int numOfItems = 0;

  List<CartProduct> productsList = [];

  // =========================
  // ADD TO CART
  // =========================

  Future<void> addToCart(String productId) async {
    try {
      emit(CartLoadingState());

      final token = SharedPrefUtils.getString(key: 'token');

      if (token == null || token.isEmpty) {
        emit(CartErrorState(errorMsg: 'You are not logged in'));
        return;
      }

      final request = AddToCartRequest(productId: productId);

      final response = await addToCartUseCase.invoke(request, token);

      numOfItems = response.numOfCartItems;

      print('NEW CART ITEMS = $numOfItems');

      emit(AddCartSuccessState(numberOfItems: numOfItems));
    } on AppException catch (e) {
      emit(CartErrorState(errorMsg: e.ErrorMsg));
    } on DioException catch (e) {
      print('ADD CART DIO ERROR = ${e.response?.data}');

      emit(CartErrorState(errorMsg: _getDioErrorMessage(e)));
    } catch (e) {
      print('ADD CART UNKNOWN ERROR = $e');

      emit(CartErrorState(errorMsg: 'Something went wrong'));
    }
  }

  // =========================
  // GET CART
  // =========================

  Future<void> getItemsInCart() async {
    try {
      emit(CartLoadingState());

      final token = SharedPrefUtils.getString(key: 'token');

      print('CART TOKEN = $token');

      if (token == null || token.isEmpty) {
        emit(CartErrorState(errorMsg: 'You are not logged in'));
        return;
      }

      final response = await getCartUseCase.invoke(token);

      numOfItems = response.numOfCartItems;

      productsList = response.data.products;

      print('GET CART ITEMS = $numOfItems');

      print('PRODUCTS COUNT = ${productsList.length}');

      for (final item in productsList) {
        print('CART ITEM ID = ${item.id}');

        print('PRODUCT ID = ${item.product.id}');
      }

      emit(
        GetCartSuccessState(response: response.data, numberOfItems: numOfItems),
      );
    } on AppException catch (e) {
      emit(CartErrorState(errorMsg: e.ErrorMsg));
    } on DioException catch (e) {
      print('GET CART DIO ERROR = ${e.response?.data}');

      emit(CartErrorState(errorMsg: _getDioErrorMessage(e)));
    } catch (e) {
      print('GET CART UNKNOWN ERROR = $e');

      emit(CartErrorState(errorMsg: e.toString()));
    }
  }

  // =========================
  // DELETE CART ITEM
  // =========================

  Future<void> deleteItemsInCart(String cartItemId) async {
    try {
      emit(DeleteCartLoadingState());

      final token = SharedPrefUtils.getString(key: 'token');

      if (token == null || token.isEmpty) {
        emit(DeleteCartErrorState(errorMsg: 'You are not logged in'));
        return;
      }

      print('DELETE CART ITEM ID = $cartItemId');

      final response = await deleteItemsUseCase.invoke(cartItemId, token);

      numOfItems = response.numOfCartItems;

      productsList = response.data.products;

      print('AFTER DELETE ITEMS = $numOfItems');

      emit(
        DeleteCartSuccessState(
          response: response.data,
          numberOfItems: numOfItems,
        ),
      );
    } on AppException catch (e) {
      emit(DeleteCartErrorState(errorMsg: e.ErrorMsg));
    } on DioException catch (e) {
      print('DELETE CART DIO ERROR = ${e.response?.data}');

      emit(DeleteCartErrorState(errorMsg: _getDioErrorMessage(e)));
    } catch (e) {
      print('DELETE CART UNKNOWN ERROR = $e');

      emit(DeleteCartErrorState(errorMsg: e.toString()));
    }
  }

  // =========================
  // UPDATE CART ITEM
  // =========================

  Future<void> updateItemsInCart(String cartItemId, int count) async {
    try {
      if (count < 1) {
        return;
      }

      emit(UpdateCartLoadingState());

      final token = SharedPrefUtils.getString(key: 'token');

      if (token == null || token.isEmpty) {
        emit(UpdateCartErrorState(errorMsg: 'You are not logged in'));
        return;
      }

      print('UPDATE CART ITEM ID = $cartItemId');

      print('NEW COUNT = $count');

      final response = await updateItemsUseCase.invoke(
        cartItemId,
        count,
        token,
      );

      numOfItems = response.numOfCartItems;

      productsList = response.data.products;

      emit(
        UpdateCartSuccessState(
          response: response.data,
          numberOfItems: numOfItems,
        ),
      );
    } on AppException catch (e) {
      emit(UpdateCartErrorState(errorMsg: e.ErrorMsg));
    } on DioException catch (e) {
      print('UPDATE CART DIO ERROR = ${e.response?.data}');

      emit(UpdateCartErrorState(errorMsg: _getDioErrorMessage(e)));
    } catch (e) {
      print('UPDATE CART UNKNOWN ERROR = $e');

      emit(UpdateCartErrorState(errorMsg: e.toString()));
    }
  }

  // =========================
  // DIO ERROR
  // =========================

  String _getDioErrorMessage(DioException e) {
    if (e.error is AppException) {
      return (e.error as AppException).ErrorMsg;
    }

    final data = e.response?.data;

    if (data is Map<String, dynamic>) {
      final message = data['message'];

      if (message != null) {
        return message.toString();
      }
    }

    return 'Unexpected error occurred';
  }
}
