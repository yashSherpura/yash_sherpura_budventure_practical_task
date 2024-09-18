import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:yash_sherpura_budventure_task/data/network/interceptors/baerer_authorization_interceptor.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

class DioFactory {
  static const Duration _defaultMaxAge = Duration(hours: 1);
  static const Duration _defaultMaxStale = Duration(days: 1);

  static Dio create() {
    final BaseOptions options = BaseOptions(
      contentType: 'application/json',
    );
    final Dio dio = Dio(options);

    final CacheConfig cacheConfig = CacheConfig(
      defaultMaxAge: _defaultMaxAge,
      defaultMaxStale: _defaultMaxStale,
      skipDiskCache: true,
    );

    final DioCacheManager dioCacheManager = DioCacheManager(cacheConfig);
    dio.interceptors.add(dioCacheManager.interceptor as Interceptor);
    dio.interceptors.add(BearerAuthorizationInterceptor());

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (Object obj) => Utility.showLog('$obj'),
      ),
    );
    return dio;
  }
}
