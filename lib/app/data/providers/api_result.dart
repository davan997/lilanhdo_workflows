class ApiResult<T> {
  dynamic error;
  T? data;

  ApiResult({
    required this.error,
    this.data,
  });
}
