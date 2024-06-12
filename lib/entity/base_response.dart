class ApiResponse<T> {
  final int errorCode;
  final String errorMsg;
  final T data;

  ApiResponse({
    required this.errorCode,
    required this.errorMsg,
    required this.data,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse<T>(
      errorCode: json['errorCode'],
      errorMsg: json['errorMsg'],
      data: fromJsonT(json['data']),
    );
  }
}
