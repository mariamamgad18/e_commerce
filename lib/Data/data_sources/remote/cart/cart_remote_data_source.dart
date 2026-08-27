import '../../../../Domain/entities/request/cart/add_to_cart_request.dart';
import '../../../../Domain/entities/response/cart/add_to_cart_response.dart';
import '../../../../Domain/entities/response/get_cart/get_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<AddToCartResponse> addToCart(
    AddToCartRequest addToCartRequest,
    String token,
  );

  Future<GetCartResponse> getItemsInCart(String token);

  Future<GetCartResponse> deleteItemsInCart(String productId, String token);

  Future<GetCartResponse> updateItemsInCart(
    String productId,
    int count,
    String token,
  );
}
