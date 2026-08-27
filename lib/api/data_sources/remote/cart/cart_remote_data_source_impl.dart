import 'package:ecommerce/api/Mapper/add_to_cart_request_mapper.dart';
import 'package:ecommerce/api/Mapper/add_to_cart_response_mapper.dart';
import 'package:ecommerce/api/Mapper/get_cart_response_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../../Data/data_sources/remote/cart/cart_remote_data_source.dart';
import '../../../../Domain/entities/request/cart/add_to_cart_request.dart';
import '../../../../Domain/entities/response/cart/add_to_cart_response.dart';
import '../../../../Domain/entities/response/get_cart/get_cart_response.dart';
import '../../../api_services.dart';
import '../../../model/request/cart/count_request_dto.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiServices apiServices;

  CartRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddToCartResponse> addToCart(
    AddToCartRequest addToCartRequest,
    String token,
  ) async {
    final response = await apiServices.addToCart(
      addToCartRequest.toAddToCartRequestDto(),
      token,
    );

    return response.toAddToCartResponse();
  }

  @override
  Future<GetCartResponse> getItemsInCart(String token) async {
    final response = await apiServices.geitemsIntCart(token);

    return response.toGetCartResponse();
  }

  @override
  Future<GetCartResponse> deleteItemsInCart(
    String productId,
    String token,
  ) async {
    final response = await apiServices.deleteItemsIntCart(productId, token);

    return response.toGetCartResponse();
  }

  @override
  Future<GetCartResponse> updateItemsInCart(
    String productId,
    int count,
    String token,
  ) async {
    final response = await apiServices.UpdateCountIntCart(
      productId,
      token,
      CountRequestDto(count: count),
    );

    return response.toGetCartResponse();
  }
}
