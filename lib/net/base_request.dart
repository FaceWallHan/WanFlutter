import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/entity/error_response.dart';
import 'package:wan_android/net/dio_net_util.dart';

import '../entity/base_response.dart';

typedef CompleteCallBack = void Function();
typedef StartCallBack = void Function();

abstract class BaseRequest<T> {
  final _dio = DioClient().dioClient;

  String url();

  T Function(dynamic) fromJsonT();

  Map<String, dynamic>? queryParameters;

  BaseRequest(this.queryParameters, this.getRequest, this.onSuccess,
      this.onFail, this.onCompleted, this.onStart) {
    request();
  }

  bool getRequest;
  ValueChanged<T>? onSuccess;
  ValueChanged<ErrorResponse>? onFail;
  CompleteCallBack? onCompleted;
  StartCallBack? onStart;

  void request() async {
    final response = await (getRequest
        ? _dio.get(url(), queryParameters: queryParameters)
        : _dio.post(url(), queryParameters: queryParameters));
    onStart!();
    if (response.statusCode == 200) {
      try {
        onSuccess!(ApiResponse.fromJson(response.data, fromJsonT()).data);
      } catch (e) {
        onFail!(ErrorResponse.fromJson(response.data));
      } finally {
        onCompleted!();
      }
    } else {
      onFail!(ErrorResponse(errorCode: -1, errorMsg: "请检查网络状态"));
    }
  }
}
