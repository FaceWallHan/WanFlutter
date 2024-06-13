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
