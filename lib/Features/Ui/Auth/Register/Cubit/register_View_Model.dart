import 'package:dio/dio.dart';
import 'package:ecommerce/Core/Errors/app_exceptions.dart';
import 'package:ecommerce/Domain/entities/request/register_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/use_cases/register_use_case.dart';
import '../../auth_states.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
    : super(AuthLoadingStates());

  var formKey = GlobalKey<FormState>();

  void Register(
    String name,
    String password,
    String email,
    String rePassword,
    String phone,
  ) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(AuthLoadingStates());
        RegisterRequest registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
        );
        var authResponse = await registerUseCase.invoke(registerRequest);
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
