import 'package:book_store/core/constants/api_constant.dart';
import 'package:book_store/core/constants/app_routes_constant.dart';
import 'package:book_store/core/constants/storage_constant.dart';
import 'package:book_store/services/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class ApiService extends GetxService {
  late StorageService storageService;
  late Dio _dio;

  Future<ApiService> init() async {
    storageService = Get.find<StorageService>();
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        contentType: 'application/json',
        headers: {'apikey': ApiConstants.apiKey},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = storageService.getValue<String>(StorageConstants.userToken);
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await storageService.remove(StorageConstants.userToken);
            Get.offAllNamed(AppRoutesConstants.LOGIN);
          }
          return handler.next(error);
        },
      ),
    );

    return this;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(path,
          queryParameters: queryParameters, options: options);
    } catch (e) {
      debugPrint('Dio get Error: $e');
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(path,
          data: data, queryParameters: queryParameters, options: options);
    } catch (e) {
      debugPrint('Dio post Error: $e');
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(path,
          data: data, queryParameters: queryParameters, options: options);
    } catch (e) {
      debugPrint('Dio put Error: $e');
      rethrow;
    }
  }

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch(path,
          data: data, queryParameters: queryParameters, options: options);
    } catch (e) {
      debugPrint('Dio patch Error: $e');
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      debugPrint('Dio delete Error: $e');
      rethrow;
    }
  }
}
