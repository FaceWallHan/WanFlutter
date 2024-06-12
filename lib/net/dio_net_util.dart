import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../entity/base_response.dart';

class DioClient {
  static DioClient? _instance;

  late Dio _dio;

  factory DioClient() => _instance ??= DioClient._init();

  DioClient._init() {
    const timeOut = Duration(seconds: 3);
    const baseUrl = "https://www.wanandroid.com/";
    _dio = Dio(BaseOptions(
        connectTimeout: timeOut, receiveTimeout: timeOut, baseUrl: baseUrl))
      ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        if (kDebugMode) {
          print("请求前拦截触发_____________请求地址：${options.uri}");
        }
        return handler.next(options);
      }));
  }

  Future<ApiResponse<T>> get<T>(String url,
      {Map<String, dynamic>? queryParameters,
      required T Function(dynamic) fromJsonT}) async {
    try {
      Response response = await _dio.get(url, queryParameters: queryParameters);
      return _handleResponse<T>(response, fromJsonT);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<T>> post<T>(String url,
      {Map<String, dynamic>? data,
      required T Function(dynamic) fromJsonT}) async {
    try {
      Response response = await _dio.post(url, data: data);
      return _handleResponse<T>(response, fromJsonT);
    } catch (e) {
      rethrow;
    }
  }

  ApiResponse<T> _handleResponse<T>(
      Response response, T Function(dynamic) fromJsonT) {
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(response.data, fromJsonT);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
