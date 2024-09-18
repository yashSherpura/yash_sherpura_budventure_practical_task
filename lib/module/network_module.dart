import 'package:dio/dio.dart';
import 'package:injector/injector.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/data/network/api/api_client.dart';
import 'package:yash_sherpura_budventure_task/data/network/dio_factory.dart';

class NetworkModule {
  static Dio createDio(Injector injector) {
    return DioFactory.create();
  }

  static ApiClient createApiClient(Injector injector) {
    return ApiClient(injector.get<Dio>(),baseUrl: StringConstants.apiBaseUrl);
  }
}
