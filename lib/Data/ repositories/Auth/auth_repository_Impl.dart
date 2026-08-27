import 'package:ecommerce/Data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:ecommerce/Domain/%20repositories/Auth/auth_repository.dart';
import 'package:ecommerce/Domain/entities/request/login_requset.dart';
import 'package:ecommerce/Domain/entities/request/register_request.dart';
import 'package:ecommerce/Domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  // Repository بتحتاج obj من dataSource
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<AuthResponse> Login(LoginRequest loginRequest) {
    return authRemoteDataSource.Login(loginRequest);
  }

  @override
  Future<AuthResponse> Register(RegisterRequest registerRequest) {
    return authRemoteDataSource.Register(registerRequest);
  }
}
