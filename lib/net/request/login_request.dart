import 'package:wan_android/consts.dart';
import 'package:wan_android/net/base_request.dart';

import '../../entity/register_response.dart';

class LoginRequest extends BaseRequest<RegisterResponse> {
  LoginRequest(super.queryParameters, super.getRequest, super.onSuccess,
      super.onFail, super.onCompleted, super.onStart);

  @override
  RegisterResponse Function(dynamic value) fromJsonT() {
    return (dynamic value) => RegisterResponse.fromJson(value);
  }

  @override
  String url() => Consts.loginUrl;
}
