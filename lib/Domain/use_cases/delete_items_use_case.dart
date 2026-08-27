import 'package:injectable/injectable.dart';

import '../ repositories/cart/cart_repository.dart';
import '../entities/response/get_cart/get_cart_response.dart';

@injectable
class DeleteItemsUseCase {
  final CartRepository cartRepository;

  DeleteItemsUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(String productId, String token) {
    return cartRepository.deleteItemsInCart(productId, token);
  }
}
