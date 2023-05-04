import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../core/utils/constants.dart';
import '../interfaces/i_rest_client.interface.dart';
import '../providers/cache_manager.provider.dart';

class RestClientService extends GetxService implements IRestClientService {
  CacheManagerProvider cacheProvider;

  late GetConnect _client;

  dynamic _reqBody;

  RestClientService({required this.cacheProvider}) {
    _client = GetConnect();

    _logPrint = print;

    _client.httpClient.baseUrl = EndPoints.apiV1;
    _client.httpClient.timeout = EndPoints.timeout;

    _client.httpClient.addRequestModifier((Request request) async {
      if (cacheProvider.getToken() != null) {
        request.headers['Authorization'] = 'Bearer ${cacheProvider.getToken()}';
      }

      _logPrint('************** Request **************');
      _printKV('uri', request.url);
      _printKV('method', request.method);
      _printKV('followRedirects', request.followRedirects);
      _logPrint('headers:');
      request.headers.forEach((key, v) => _printKV(' $key', v));
      _logPrint('data:');
      if (_reqBody is Map) {
        _reqBody?.forEach((key, v) => _printKV(' $key', v));
      } else {
        _printAll(_reqBody.toString());
      }
      _logPrint('*************************************');

      return request;
    });

    _client.httpClient.addResponseModifier((request, response) {
      _logPrint('************** Response **************');
      _printKV('uri', response.request!.url);
      _printKV('statusCode', response.statusCode!);
      if (response.headers != null) {
        _logPrint('headers:');
        response.headers?.forEach((key, v) => _printKV(' $key', v));
      }
      _logPrint('Response Text:');
      _printAll(response.bodyString);
      _logPrint('*************************************');
      return response;
    });
  }

  late void Function(Object object) _logPrint;

  @override
  Future<Response<T>> find<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    T Function(dynamic p1)? decoder,
  }) {
    _reqBody = query;

    return _client.httpClient.get(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    )..whenComplete(() => _reqBody = null);
  }

  @override
  Future<Response<T>> insert<T>(
    String? url, {
    required dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
    dynamic Function(double)? uploadProgress,
  }) {
    _reqBody = body;

    return _client.httpClient.post(
      url,
      body: body,
      contentType: contentType,
      headers: headers,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    )..whenComplete(() => _reqBody = null);
  }

  @override
  Future<Response<T>> update<T>(
    String url, {
    required dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
    dynamic Function(double)? uploadProgress,
  }) {
    _reqBody = body;

    return _client.httpClient.put(
      url,
      body: body,
      contentType: contentType,
      headers: headers,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    )..whenComplete(() => _reqBody = null);
  }

  @override
  Future<Response<T>> remove<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    T Function(dynamic)? decoder,
  }) {
    _reqBody = query;

    return _client.httpClient.delete(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    )..whenComplete(() => _reqBody = null);
  }

  void _printKV(String key, Object v) {
    _logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(_logPrint);
  }
}
