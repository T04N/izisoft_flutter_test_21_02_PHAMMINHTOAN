import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app_api.dart';
import 'interceptor/auth_interceptor.dart';


/// ApiManager: Manages Dio instances and service configurations
class ApiManager {
  /// Singleton instance
  static final ApiManager _instance = ApiManager._();

  /// Factory constructor to return the Singleton instance
  factory ApiManager() => _instance;

  /// Private constructor
  ApiManager._();

  /// Dio client for standard requests
  late final Dio _dioClient;

  /// SahaService instance
  late final AppServiceClient _service;

  /// Getter for SahaService
  AppServiceClient get service => _service;

  /// Initialize the manager (call once during app startup)
  Future<void> initialize() async {
    _dioClient = _createDio();
    _service = AppServiceClient(_dioClient);
  }

  /// Create and configure Dio instance
  Dio _createDio() {
    final options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 35),
      receiveTimeout: const Duration(seconds: 35),
      responseType: ResponseType.json,
    );

    final dio = Dio(options);

    // Add authentication interceptor
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    print("Dio initialized with base URL: ${options.baseUrl}");

    return dio;
  }
}
