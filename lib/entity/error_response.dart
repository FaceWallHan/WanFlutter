class ErrorResponse {
  final int errorCode;
  final String errorMsg;

  ErrorResponse({
    required this.errorCode,
    required this.errorMsg,
  });

  factory ErrorResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      ErrorResponse(
        errorCode: json['errorCode'],
        errorMsg: json['errorMsg'],
      );

  Map<String, dynamic> toJson() =>
      {"errorCode": errorCode, "errorMsg": errorMsg};
}
