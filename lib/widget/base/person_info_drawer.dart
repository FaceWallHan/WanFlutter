import 'package:flutter/material.dart';
import 'package:wan_android/widget/drawer_item_widget.dart';

import '../../entity/drawer_item.dart';
import '../../consts.dart';

class PersonInfoDrawer extends StatelessWidget {
  const PersonInfoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: [
              _addTopPersonal(),
              _addBottomList(),
            ],
          )),
    );
  }

  Expanded _addBottomList() {
    final list = _addDrawerList();
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemBuilder: (_, int index) => DrawerItemWidget(item: list[index]),
        itemCount: list.length,
      ),
    );
  }

  Container _addTopPersonal() => Container(
      padding: const EdgeInsets.only(top: 20),
      height: 280,
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "images/rank.png",
                    width: Consts.iconSize,
                    height: Consts.iconSize,
                    color: Colors.white,
                    alignment: Alignment.centerRight,
                  ))
            ],
          ),
          const SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/header_default.png"),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("去登录",
                style: TextStyle(fontSize: Consts.textFontSize)),
          ),
          Text("等级：-- 排名：--", style: TextStyle(fontSize: Consts.textFontSize)),
        ],
      ));

  List<DrawerItem> _addDrawerList() => <DrawerItem>[
        DrawerItem("我的积分", Icons.add, () {}),
        DrawerItem("我的收藏", Icons.hearing, () {}),
        DrawerItem("我的分享", Icons.share, () {}),
        DrawerItem("TODO", Icons.today_outlined, () {}),
        DrawerItem("夜间模式", Icons.shield_moon, () {}),
        DrawerItem("系统设置", Icons.settings, () {})
      ];
}
