import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wan_android/widget/banner/main_banner.dart';

import '../entity/home_article_item.dart';
import '../viewmodel/home_view_model.dart';
import 'article_list_widget.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key}) {
    _loadData();
    _scrollController.addListener(() => _scrollListener());
  }

  final _scrollController = ScrollController();

  final _currentPage = 0.obs;
  final _items = <ArticleDataItem>[].obs;
  final _loading = false.obs;

  final viewModel = HomeViewModel();

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    if (_loading.value) return;
    _loading.value = true;
    try {
      var response = await viewModel.requestArticle(page: _currentPage.value);
      _items.addAll(response.data.datas);
      _loading.value = false;
      _currentPage.value++;
    } catch (e) {
      _loading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: MainBanner(),
        ),
        Obx(
          () => SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index.isOdd) {
                // 返回分隔线
                return const Divider(
                  height: 1,
                );
              } else {
                final itemIndex = index ~/ 2;
                if (itemIndex < _items.length) {
                  // 返回列表项
                  return ArticleListWidget(
                    item: _items[itemIndex],
                  );
                } else if (_loading.value) {
                  // 返回加载指示器
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  // 不返回任何内容
                  return const SizedBox.shrink();
                }
              }
            },
            childCount: _items.length * 2 + (_loading.value ? 1 : 0),
          )),
        )
      ],
    );
  }
}
