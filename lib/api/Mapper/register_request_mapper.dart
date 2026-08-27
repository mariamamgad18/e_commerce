import 'package:ecommerce/Domain/entities/request/register_request.dart';

import '../model/request/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto ToRegisterRequestDto() {
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}
