import 'package:ecommerce/Domain/%20repositories/Auth/auth_repository.dart';
import 'package:ecommerce/Domain/entities/request/register_request.dart';
import 'package:ecommerce/Domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<AuthResponse> invoke(RegisterRequest registerRequest) {
    return authRepository.Register(registerRequest);
  }
}
