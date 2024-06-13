import 'package:flutter/material.dart';

import 'package:pair/pair.dart';

class Consts {
  Consts._();

  static const iconSize = 35.0;
  static const textFontSize = 15.0;
  static const mainColor = Colors.blue;
  static const List<Pair<String, String>> itemList = [
    Pair("home.png", "首页"),
    Pair("square.png", "广场"),
    Pair("wechat.png", "微信"),
    Pair("menu.png", "菜单"),
    Pair("project.png", "项目"),
  ];

  static const bannerUrl = "banner/json";

  static String getArticleUrl(int page) => "article/list/$page/json";
}
