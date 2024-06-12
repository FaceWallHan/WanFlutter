import 'package:flutter/material.dart';

import 'package:wan_android/utils/time_utils.dart';

import '../entity/home_article_item.dart';

class ArticleListWidget extends StatelessWidget {
  final ArticleDataItem item;

  const ArticleListWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTop(),
          Text(item.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              )),
          getBottom()
        ],
      ),
    );
  }

  Widget getTop() {
    final weChatNumber = getWeChatNumber();
    return Flex(
      direction: Axis.horizontal,
      children: [
        weChatNumber,
        Padding(
          padding: EdgeInsets.only(left: weChatNumber is Container ? 10 : 0),
          child: Text(item.author.isEmpty ? item.chapterName : item.author),
        ),
        const Spacer(),
        Text(item.shareDate.translationTime(item.niceShareDate)),
      ],
    );
  }

  Widget getBottom() => SizedBox(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${item.superChapterName}/${item.chapterName}"),
            const Spacer(),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  item.collect ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      );

  Widget getWeChatNumber() =>
      (item.tags.isNotEmpty && item.superChapterName == "公众号")
          ? Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade500),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Text(
                item.superChapterName,
                style: const TextStyle(),
              ),
            )
          : const SizedBox.shrink();
}
