import 'package:ecommerce/Domain/entities/request/login_requset.dart';
import 'package:ecommerce/api/model/request/login_request_dto.dart';

//هنا بنحول من
// LoginRequest >>>> LoginRequestDto
extension LoginRequestMapper on LoginRequest {
  LoginRequestDto TologinRequestDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
