import 'package:flutter/material.dart';

import '../consts.dart';
import '../entity/drawer_item.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerItem item;

  const DrawerItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
          onPressed: item.onPressed,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: Consts.iconSize),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  item.label,
                  style: const TextStyle(fontSize: Consts.textFontSize),
                ),
              )
            ],
          )),
    );
  }
}
