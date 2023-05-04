import 'package:get/get.dart';

abstract class IRestClientService {
  Future<Response<T>> find<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

  Future<Response<T>> insert<T>(
    String? url, {
    required dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
    dynamic Function(double)? uploadProgress,
  });

  Future<Response<T>> update<T>(
    String url, {
    required dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
    dynamic Function(double)? uploadProgress,
  });

  Future<Response<T>> remove<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  });

  // Future<IRestClientService> init();
}
