import 'package:ecommerce/Domain/%20repositories/Auth/auth_repository.dart';
import 'package:ecommerce/Domain/entities/request/login_requset.dart';
import 'package:ecommerce/Domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<AuthResponse> invoke(LoginRequest loginRequest) {
    return authRepository.Login(loginRequest);
  }
}
