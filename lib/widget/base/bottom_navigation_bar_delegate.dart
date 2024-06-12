import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts.dart';

class BottomNavigationBarDelegate extends StatelessWidget {
  final ValueSetter<int> titleCallback;

  final _bottomIndex = 0.obs;

  BottomNavigationBarDelegate({super.key, required this.titleCallback});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: _addBottomBarItem(),
        selectedItemColor: Consts.mainColor,
        currentIndex: _bottomIndex.value,
        onTap: (index) {
          _bottomIndex.value = index;
          titleCallback(_bottomIndex.value);
        },
      );
    });
  }

  List<BottomNavigationBarItem> _addBottomBarItem() =>
      Consts.itemList.map((value) {
        return BottomNavigationBarItem(
            icon: _addBottomIcon(value.key),
            label: value.value,
            activeIcon: _addBottomIcon(value.key, iconColor: Consts.mainColor));
      }).toList();

  Image _addBottomIcon(String localImg, {Color iconColor = Colors.black}) {
    const size = 25.0;
    return Image.asset(
      "images/$localImg",
      width: size,
      height: size,
      color: iconColor,
    );
  }
}
