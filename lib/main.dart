import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/receiver/scroll_receiver.dart';
import 'package:wan_android/utils/route_util.dart';

import 'widget/base/base_widget.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final scrollState = Get.put(ScrollReceiver());

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BaseWidget(),
      getPages: RouteUtil.routeTableList,
    );
  }
}
