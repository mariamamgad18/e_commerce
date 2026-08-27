import 'package:ecommerce/Domain/entities/response/auth_response.dart';

abstract class AuthStates {}

class AuthLoadingStates extends AuthStates {}

class AuthErrorStates extends AuthStates {
  String ErrorMsg;

  AuthErrorStates({required this.ErrorMsg});
}

class AuthSuccessStates extends AuthStates {
  AuthResponse authResponse;

  AuthSuccessStates({required this.authResponse});
}
