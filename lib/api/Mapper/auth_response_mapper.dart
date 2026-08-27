import 'package:ecommerce/Domain/entities/response/auth_response.dart';
import 'package:ecommerce/api/Mapper/user_mapper.dart';
import 'package:ecommerce/api/model/response/auth_response_dto.dart';

//AuthResponseDto >>> AuthResponse
extension AuthResponseMapper on AuthResponseDto {
  AuthResponse ToAuthResponse() {
    if (token != null || token!.isNotEmpty || user != null) {
      return AuthResponse(message: message, user: user!.ToUser(), token: token);
    } else {
      throw Exception();
    }
  }
}
