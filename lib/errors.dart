import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

String mapError(
  dynamic e,
) {
  if (e is DioException) {
    return mapDioError(e) ?? StringConstants.errorErrorView;
  } else if (e is PlatformException) {
    return e.message ?? StringConstants.errorErrorView;
  } else if (e is SocketException) {
    return StringConstants.errorNoInternet;
  }
  return e.toString();
}

String? mapDioError(DioException error) {
  if (error.response?.statusCode == 401) {
    return StringConstants.errorUnauthorizedToken;
  }

  String? errorMsg;
  if (error.response != null) {
    final dynamic responseData = error.response?.data;
    if (responseData is Map) {
      try {
        final Map<String, dynamic> errorMap =
            responseData.cast<String, dynamic>();
        final ApiError apiError = ApiError.fromMap(errorMap);
        apiError.statusCode = error.response?.statusCode;
        if (apiError.error != null) {
          errorMsg = apiError.message;
        } else if (apiError.statusCode == 401) {
          errorMsg = StringConstants.errorUnauthorizedToken;
        } else if (apiError.message != null) {
          errorMsg = apiError.error;
        }
      } catch (e) {
        Utility.showLog('e:$e');
      }
    }
  } else if (error.error.runtimeType == SocketException ||
      error.error.runtimeType == HttpException) {
    errorMsg = StringConstants.errorNoInternet;
  }
  return errorMsg;
}

class ApiError {
  ApiError(this.message, this.error, this.statusCode);

  factory ApiError.fromMap(Map<String, dynamic> map) {
    return ApiError(
      map['message'] as String?,
      map['error'] as String?,
      map['statusCode'] as int?,
    );
  }

  final String? message;
  final String? error;
  int? statusCode;
}
