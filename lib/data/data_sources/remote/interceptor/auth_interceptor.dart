import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


/// Interceptor for adding authentication and security headers to Dio requests.
class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.headers['fr-app'] = 'obdata';


    // final token = UserInfo().getToken();
    // if (token != null) {
    //   options.headers["fr-token"] = token;
    // }


    // Check for MultipartFile and convert data to FormData if necessary
    if (_hasMultipartData(options)) {
      options.data = FormData.fromMap(options.data as Map<String, dynamic>);
    }

    handler.next(options); // Continue with the request
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {

    print('Error occurred: ${error.response}');

    handler.next(error); // Continue with the error
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is String) {
      try {
        response.data = json.decode(response.data);
        print("testing ${response.data}");
      } on FormatException {
        print('Response is not a valid JSON string.');
      }
    }

    // Handle business logic based on response codes


    handler.next(response); // Continue with the response
  }

  /// Check if the request contains MultipartFile data
  bool _hasMultipartData(RequestOptions options) {
    if (options.data is Map) {
      return (options.data as Map).values.any((element) => element is MultipartFile);
    }
    return false;
  }

}
