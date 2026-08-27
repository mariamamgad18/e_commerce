abstract class AppException implements Exception {
  String ErrorMsg;
  int? StatusCode;

  AppException({required this.ErrorMsg, this.StatusCode});
}

class ServerError extends AppException {
  ServerError({required super.ErrorMsg, super.StatusCode});
}

class NetworkError extends AppException {
  NetworkError({required super.ErrorMsg, super.StatusCode});
}

class UnExpectedError extends AppException {
  UnExpectedError({required super.ErrorMsg, super.StatusCode});
}
