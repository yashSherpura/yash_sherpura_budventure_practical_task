import 'package:dio/dio.dart';
import 'package:yash_sherpura_budventure_task/constants/api_keys.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';

class BearerAuthorizationInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final Map<String, dynamic> headers =
        Map<String, dynamic>.from(options.headers);

    headers[ApiKeys.keyAuthorization] = StringConstants.labelAuthorizationToken;

    options.headers = headers;
    handler.next(options);
  }
}
