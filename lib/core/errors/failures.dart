// ignore_for_file: unreachable_switch_default

import 'package:dio/dio.dart';

abstract class Failures {
  final String message;

  const Failures(this.message);
}

class ServerFailure extends Failures {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    late String message;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with api server";
      case DioExceptionType.sendTimeout:
        message = "send timout with api server";
      case DioExceptionType.receiveTimeout:
        message = "receive timout with api server";
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response);
      case DioExceptionType.cancel:
        message = "request with api server was cenceled";
      case DioExceptionType.connectionError:
        message = "connection error";
      case DioExceptionType.unknown:
        message = "unexpected error try again";
      default:
        message = "unexpected error try again";
    }
    return ServerFailure(message);
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic responnse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(responnse["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure("your request not found plase try again");
    } else if (statusCode == 500) {
      return ServerFailure("internal server failure");
    } else {
      return ServerFailure("opps there was error");
    }
  }
}
