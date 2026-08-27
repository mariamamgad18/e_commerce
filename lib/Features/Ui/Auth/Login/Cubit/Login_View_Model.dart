import 'package:dio/dio.dart';
import 'package:ecommerce/Core/Errors/app_exceptions.dart';
import 'package:ecommerce/Domain/entities/request/login_requset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/use_cases/login_use_case.dart';
import '../../auth_states.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(AuthLoadingStates());

  var formKey = GlobalKey<FormState>();

  void login(String email, String password) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(AuthLoadingStates());
        LoginRequest loginRequest = LoginRequest(
          email: email,
          password: password,
        );
        var authResponse = await loginUseCase.invoke(loginRequest);
        emit(AuthSuccessStates(authResponse: authResponse));
      }
    } on AppException catch (e) {
      emit(AuthErrorStates(ErrorMsg: e.ErrorMsg));
    } on DioException catch (e) {
      final message =
          (e.error is AppException)
              ? (e.error as AppException).ErrorMsg
              : 'UnException Error occurred';
      emit(AuthErrorStates(ErrorMsg: message));
    }
  }
}
