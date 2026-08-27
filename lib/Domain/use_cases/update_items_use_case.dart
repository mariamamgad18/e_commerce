import 'package:injectable/injectable.dart';

import '../ repositories/cart/cart_repository.dart';
import '../entities/response/get_cart/get_cart_response.dart';

@injectable
class UpdateItemsUseCase {
  final CartRepository cartRepository;

  UpdateItemsUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(String productId, int count, String token) {
    return cartRepository.updateItemsInCart(productId, count, token);
  }
}
