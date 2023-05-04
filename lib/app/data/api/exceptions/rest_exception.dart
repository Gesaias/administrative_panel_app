class RestException implements Exception {
  final String msg;
  final int status;

  RestException({
    required this.status,
    required this.msg,
  });

  @override
  String toString() => 'RestException(statusCode: $status, message: $msg)';
}
