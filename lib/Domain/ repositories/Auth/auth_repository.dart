import 'package:ecommerce/Domain/entities/response/auth_response.dart';

import '../../entities/request/login_requset.dart';
import '../../entities/request/register_request.dart';

abstract class AuthRepository {
  Future<AuthResponse> Login(LoginRequest loginRequest);

  Future<AuthResponse> Register(RegisterRequest registerRequest);
}
