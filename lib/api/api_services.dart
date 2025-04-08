// api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://staymate-ten.vercel.app',
          connectTimeout: const Duration(seconds: 120),
          receiveTimeout: const Duration(seconds: 120),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {'username': username, 'email': email, 'pass': password},
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'pass': password},
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    String errorMessage = 'An error occurred';
    print(error);
    if (error.response != null) {
      errorMessage = error.response!.data['message'] ?? 'Operation failed';
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Exception('Connection timeout: Please check your internet');
      case DioExceptionType.sendTimeout:
        return Exception('Send timeout: Please try again');
      case DioExceptionType.receiveTimeout:
        return Exception('Server not responding: Please try again later');
      case DioExceptionType.badResponse:
        return Exception(errorMessage);
      default:
        return Exception('Error: $errorMessage');
    }
  }
}
