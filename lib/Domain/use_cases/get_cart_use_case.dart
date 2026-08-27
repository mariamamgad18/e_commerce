import 'package:injectable/injectable.dart';

import '../ repositories/cart/cart_repository.dart';
import '../entities/response/get_cart/get_cart_response.dart';

@injectable
class GetCartUseCase {
  final CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(String token) {
    return cartRepository.getItemsInCart(token);
  }
}
