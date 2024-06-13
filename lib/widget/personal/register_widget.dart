import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts.dart';
import '../../utils/route_util.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();
  final _againPwdController = TextEditingController();

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
              inflateForm(),
              goRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Padding inflateSubmitButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
              },
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

  Form inflateForm() => Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Flex(
        direction: Axis.vertical,
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
                labelText: "用户名", hintText: "用户名", icon: Icon(Icons.person)),
            validator: (value) => value!.trim().length > 5 ? null : "用户名不能少于6位",
          ),
          TextFormField(
              controller: _pwdController,
              decoration: const InputDecoration(
                  labelText: "密码", hintText: "密码", icon: Icon(Icons.lock)),
              validator: (value) =>
                  value!.trim().length > 5 ? null : "密码不能少于6位"),
          TextFormField(
              controller: _pwdController,
              decoration: const InputDecoration(
                  labelText: "再输入一次密码",
                  hintText: "再输入一次密码",
                  icon: Icon(Icons.lock)),
              validator: ((value) => value!.trim().length > 5
                  ? (_pwdController.text == _againPwdController.text
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
