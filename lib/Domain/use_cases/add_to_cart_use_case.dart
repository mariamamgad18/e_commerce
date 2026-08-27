import 'package:injectable/injectable.dart';

import '../ repositories/cart/cart_repository.dart';
import '../entities/request/cart/add_to_cart_request.dart';
import '../entities/response/cart/add_to_cart_response.dart';

@injectable
class AddToCartUseCase {
  final CartRepository cartRepository;

  AddToCartUseCase({required this.cartRepository});

  Future<AddToCartResponse> invoke(
    AddToCartRequest addToCartRequest,
    String token,
  ) {
    return cartRepository.addToCart(addToCartRequest, token);
  }
}
