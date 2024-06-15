import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/net/request/login_request.dart';
import 'package:wan_android/utils/route_util.dart';

import '../../consts.dart';
import '../../utils/toast_utils.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var loginEnabled = true;

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, String>?;
    if (args != null) {
      widget
        .._usernameController.text = args["username"]!
        .._pwdController.text = args["password"]!;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Consts.mainColor,
        title: const Text("登录"),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              const Text(
                "用户登录",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const Text("请使用WanAndroid账号登录！",
                  style: TextStyle(fontSize: Consts.textFontSize)),
              inflateForm(),
              goRegister(),
            ],
          ),
        ),
      ),
    );
  }

  void goLogin() {
    final user = widget._usernameController.text;
    final pwd = widget._pwdController.text;
    LoginRequest(<String, String>{
      "username": user,
      "password": pwd,
    }, false, (value) {
      showToast("登录成功");
    }, (e) {
      showToast(e.errorMsg);
    }, () {
      loginEnabled = true;
    }, () {
      loginEnabled = false;
    });
  }

  Padding inflateSubmitButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () => loginEnabled
                  ? {
                      if (widget._formKey.currentState!.validate()) {goLogin()}
                    }
                  : null,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Consts.mainColor),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "登录",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ))
          ],
        ),
      );

  Form inflateForm() => Form(
      key: widget._formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Flex(
        direction: Axis.vertical,
        children: [
          TextFormField(
            controller: widget._usernameController,
            decoration: const InputDecoration(
                labelText: "用户名", hintText: "用户名", icon: Icon(Icons.person)),
            validator: (value) => value!.trim().isNotEmpty ? null : "用户名不能为空",
          ),
          TextFormField(
              obscureText: true,
              controller: widget._pwdController,
              decoration: const InputDecoration(
                  labelText: "密码", hintText: "密码", icon: Icon(Icons.lock)),
              validator: (value) =>
                  value!.trim().length > 5 ? null : "密码不能少于6位"),
          inflateSubmitButton()
        ],
      ));

  Flex goRegister() => Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              child: Flex(
            crossAxisAlignment: CrossAxisAlignment.end,
            direction: Axis.vertical,
            children: [
              TextButton(
                onPressed: () => Get.offNamed(RouteAction.register.name),
                child: const Text("没有账号？去注册"),
              )
            ],
          ))
        ],
      );
}
