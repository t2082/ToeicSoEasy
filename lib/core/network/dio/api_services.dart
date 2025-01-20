import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:toeicsoeasy/core/contants/api_url.dart';

class ApiService {
  static final ApiService _instance = ApiService
      ._internal(); //Tạo một đối tượng duy nhất của class (chỉ dùng bên trong class)
  final Dio _dio = Dio();

  // Base API URL
  final String baseUrl = ApiUrl.baseURL;

  // (1) Khi gọi lần đầu tiên, factory ApiService() -> _instance -> khởi tạo ApiService._internal() Trả về đối tượng đã tạo (2) (Singleton).
  factory ApiService() {
    return _instance;
  }

  // (2) Private constructor
  ApiService._internal() {
    //Constructor riêng (private), chỉ được gọi bên trong class.
    _dio.options = BaseOptions(
      // Cấu hình cơ bản để gửi dữ liệu
      headers: {
        //Header mặc định
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'apikey': ApiUrl.token,
      },
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    );

    // _dio.interceptors.add(LogInterceptor(
    //   //Ghi lại các request đã gửi và nhận về từ server
    //   requestBody: true,
    //   responseBody: true,
    // ));

    // Add error handling interceptor
    // _dio.interceptors.add(InterceptorsWrapper(
    //   onError: (DioException error, ErrorInterceptorHandler handler) async {
    //     log('Error: ${error.message}', name: 'lỗi trong interceptors');
    //     // Handle different error types
    //     switch (error.type) {
    //       case DioExceptionType.connectionTimeout:
    //         log('Error: ${error.message}', name: 'lỗi trong interceptors');
    //       case DioExceptionType.receiveTimeout:
    //         log('Error: ${error.message}', name: 'lỗi trong interceptors');
    //       // throw TimeoutException('Request timeout');
    //       case DioExceptionType.badResponse:
    //         log('Error: ${error.message}', name: 'lỗi trong interceptors');
    //       // throw ApiException(error.response?.statusCode ?? 500,
    //       //     error.response?.data?['message'] ?? 'Unknown error');
    //       default:
    //         log('Error: ${error.message}', name: 'lỗi trong interceptors');
    //       // throw ApiException(500, 'Network error occurred');
    //     }
    //   },
    // ));
  }

  // Generic GET request
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Generic POST request
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      // Kiểm tra nếu có phản hồi từ server
      if (e.response != null) {
        // Lấy phần dữ liệu của phản hồi
        throw e.response?.data; // Ném responseData về
        // log(responseData.toString(), name: 'line 106, api_services.dart');
      } else {
        log('No response received from the server.',
            name: 'line 111, api_services.dart');
      }
      rethrow; // Ném lại lỗi sau khi xử lý
    } catch (e) {
      // Xử lý lỗi ngoài DioException (nếu có)
      log(e.toString(), name: 'post in ApiService');
      rethrow; // Ném lại lỗi để xử lý ở nơi gọi hàm
    }
  }

  // Generic PUT request
  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Generic DELETE request
  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Method to update authorization token
  void updateAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
}

// Custom exception class for API errors
class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() => 'ApiException: $statusCode - $message';
}

// Custom timeout exception
class TimeoutException implements Exception {
  final String message;

  TimeoutException(this.message);

  @override
  String toString() => 'TimeoutException: $message';
}
