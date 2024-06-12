import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/widget/home_widget.dart';

import '../../consts.dart';
import 'bottom_navigation_bar_delegate.dart';
import 'person_info_drawer.dart';

class BaseWidget extends StatelessWidget {
  BaseWidget({super.key});

  final _title = Consts.itemList.first.value.obs;

  final _widgetArr = <Widget>[HomeWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(_title.value)),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu));
          },
        ),
        backgroundColor: Consts.mainColor,
      ),
      body: _widgetArr.first,
      bottomNavigationBar: BottomNavigationBarDelegate(
        titleCallback: (index) {
          _title.value = Consts.itemList[index].value;
        },
      ),
      drawer: const PersonInfoDrawer(),
    );
  }
}
