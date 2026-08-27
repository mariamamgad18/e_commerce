import 'package:injectable/injectable.dart';

import '../../../Domain/ repositories/cart/cart_repository.dart';
import '../../../Domain/entities/request/cart/add_to_cart_request.dart';
import '../../../Domain/entities/response/cart/add_to_cart_response.dart';
import '../../../Domain/entities/response/get_cart/get_cart_response.dart';
import '../../data_sources/remote/cart/cart_remote_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<AddToCartResponse> addToCart(
    AddToCartRequest addToCartRequest,
    String token,
  ) {
    return cartRemoteDataSource.addToCart(addToCartRequest, token);
  }

  @override
  Future<GetCartResponse> getItemsInCart(String token) {
    return cartRemoteDataSource.getItemsInCart(token);
  }

  @override
  Future<GetCartResponse> deleteItemsInCart(String productId, String token) {
    return cartRemoteDataSource.deleteItemsInCart(productId, token);
  }

  @override
  Future<GetCartResponse> updateItemsInCart(
    String productId,
    int count,
    String token,
  ) {
    return cartRemoteDataSource.updateItemsInCart(productId, count, token);
  }
}
