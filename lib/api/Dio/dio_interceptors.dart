import 'package:dio/dio.dart';
import 'package:ecommerce/Core/Errors/app_exceptions.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //هعمل obj من ال : AppException
    AppException exception;

    //هاتلي الداتا اللي جيالي من الريسبونس حطها ف المتغير ده
    final responseData = err.response?.data;
    String Message = "something went wrong !";

    //هتِشيك علي الريسبونس من نوع ماب ولا لأ
    //  لو هي ماب , ساعتها المسدج دي ليها احتمالين
    // Message = " Incorrect email or password "
    //Message =  "msg": "Invalid email
    // دول اكتشفتهم ف التيست بتاع ال Api

    //todo : 1-
    /*
{
    "message": "fail",
    "errors": {
        "value": "amira2556@gmail.com1",
        "msg": "Invalid email",
        "param": "email",
        "location": "body"
    }
}
 */
    //todo : 2-
    /*
{
    "statusMsg": "fail",
    "message": "Incorrect email or password"
}
 */

    if (responseData is Map) {
      Message =
          (responseData['errors']?['msg'] as String?) ??
          (responseData['message'] as String?) ??
          Message;
      /*
      يعني ي هيعرض :
      1-"Invalid email"
      2-"Incorrect email or password"
      3-"something went wrong !";

      * */
    }

    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout) {
      exception = NetworkError(ErrorMsg: 'No interner connection');
    } else if (err.response?.statusCode != null) {
      exception = ServerError(
        ErrorMsg: Message,
        StatusCode: err.response?.statusCode,
      );
    } else {
      exception = UnExpectedError(ErrorMsg: Message);
    }

    handler.next(
      DioException(requestOptions: err.requestOptions, error: exception),
    );
  }
}
