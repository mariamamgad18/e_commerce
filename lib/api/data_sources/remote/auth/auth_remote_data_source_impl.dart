import 'package:ecommerce/Data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:ecommerce/Domain/entities/request/login_requset.dart';
import 'package:ecommerce/api/Mapper/auth_response_mapper.dart';
import 'package:ecommerce/api/Mapper/login_request_mapper.dart';
import 'package:ecommerce/api/Mapper/register_request_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../../Domain/entities/request/register_request.dart';
import '../../../../Domain/entities/response/auth_response.dart';
import '../../../api_services.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  //DataSource بتحتاج obj من ApiServices
  ApiServices apiServices;

  AuthRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AuthResponse> Login(LoginRequest loginRequest) async {
    //لو جيت عملت كده
    // apiServices.login(loginRequest)
    //مش هينفع عشان مش بتقبل غير loginRequestDto
    //عايزة اعمل االتحويله دي
    //todo :loginRequest >> loginRequestDto
    // هعمل mapper يحول

    var loginResponse = await apiServices.login(
      loginRequest.TologinRequestDto(),
    );

    // لو قولت return loginResponse;
    // هيحصل ايرور عشان ال loginResponse نوعها >> AuthResponseDto
    // و الفانكشن بترجع >> AuthResponse
    //عايزة اعمل التحويله دي
    //todo: AuthResponseDto >> AuthResponse
    // هروح AuthResponseDto اعمل فانكشن تحول ل >> AuthResponseD

    return loginResponse.ToAuthResponse();
  }

  @override
  Future<AuthResponse> Register(RegisterRequest registerRequest) async {
    var RegisterResponse = await apiServices.Register(
      registerRequest.ToRegisterRequestDto(),
    );
    return RegisterResponse.ToAuthResponse();
  }
}
