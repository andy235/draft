import 'package:data/models/response_model.dart';
import 'package:conduit_core/conduit_core.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AppResponse extends Response {
  AppResponse.serverError(dynamic error, {String? message})
      : super.serverError(body: _getResponseModel(error, message));

  static ResponseModelP _getResponseModel(error, String? message) {
    if (error is QueryException) {
      return ResponseModelP(
          error: error.toString(), message: message ?? error.message);
    }

    if (error is JwtException) {
      return ResponseModelP(
          error: error.toString(), message: message ?? error.message);
    }

    return ResponseModelP(
        error: error.toString(), message: message ?? "Неизвестная ошибка");
  }

  AppResponse.ok({dynamic body, String? message})
      : super.ok(ResponseModelP(data: body, message: message));

  AppResponse.badRequest({String? message})
      : super.badRequest(
            body: ResponseModelP(message: message ?? "Ошибка запроса"));
}
