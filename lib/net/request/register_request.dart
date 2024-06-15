import 'package:wan_android/entity/register_response.dart';
import 'package:wan_android/net/base_request.dart';

import '../../consts.dart';

class RegisterRequest extends BaseRequest<RegisterResponse> {
  RegisterRequest(super.queryParameters, super.getRequest, super.onSuccess,
      super.onFail, super.onCompleted, super.onStart);

  @override
  RegisterResponse Function(dynamic value) fromJsonT() {
    return (dynamic value) => RegisterResponse.fromJson(value);
  }

  @override
  String url() => Consts.registerUrl;
}
