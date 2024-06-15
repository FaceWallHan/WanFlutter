import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/net/request/register_request.dart';
import 'package:wan_android/utils/toast_utils.dart';

import '../../consts.dart';
import '../../utils/route_util.dart';

class RegisterWidget extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();
  final _againPwdController = TextEditingController();

  RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  var registerEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Consts.mainColor,
        title: const Text("注册"),
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
                "注册用户",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const Text("用户注册后才可以登录！",
                  style: TextStyle(fontSize: Consts.textFontSize)),
              inflateForm(context),
              goRegister(),
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    final user = widget._usernameController.text;
    final pwd = widget._pwdController.text;
    final rePwd = widget._againPwdController.text;

    RegisterRequest({
      "username": user,
      "password": pwd,
      "repassword": rePwd,
    }, false, (v) {
      Get.offNamed(RouteAction.login.name,
          arguments: {"username": user, "password": pwd});
      showToast("注册成功");
    }, (e) {
      showToast(e.errorMsg);
    }, () {
      registerEnabled = true;
    }, () {
      registerEnabled = false;
    });
  }

  Padding inflateSubmitButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () => registerEnabled
                  ? {
                      if (widget._formKey.currentState!.validate()) {register()}
                    }
                  : null,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Consts.mainColor),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "注册",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ))
          ],
        ),
      );

  Form inflateForm(BuildContext context) => Form(
      key: widget._formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Flex(
        direction: Axis.vertical,
        children: [
          TextFormField(
            controller: widget._usernameController,
            decoration: const InputDecoration(
                labelText: "用户名", hintText: "用户名", icon: Icon(Icons.person)),
            validator: (value) => value!.trim().length > 5 ? null : "用户名不能少于6位",
          ),
          TextFormField(
              controller: widget._pwdController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "密码", hintText: "密码", icon: Icon(Icons.lock)),
              validator: (value) =>
                  value!.trim().length > 5 ? null : "密码不能少于6位"),
          TextFormField(
              obscureText: true,
              controller: widget._againPwdController,
              decoration: const InputDecoration(
                  labelText: "再输入一次密码",
                  hintText: "再输入一次密码",
                  icon: Icon(Icons.lock)),
              validator: ((value) => value!.trim().length > 5
                  ? (widget._pwdController.text !=
                          widget._againPwdController.text
                      ? "两次密码不相同"
                      : null)
                  : "密码不能少于6位")),
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
                onPressed: () {
                  Get.offNamed(RouteAction.login.name);
                },
                child: const Text("已有账号？去登录"),
              )
            ],
          ))
        ],
      );
}
