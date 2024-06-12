
import 'package:wan_android/consts.dart';
import 'package:wan_android/entity/banner_item.dart';
import 'package:wan_android/entity/base_response.dart';
import 'package:wan_android/net/dio_net_util.dart';

import '../entity/home_article_item.dart';

class HomeViewModel {
  Future<ApiResponse<List<BannerItem>>> requestBanner() async {
    return DioClient().get<List<BannerItem>>(Consts.bannerUrl,
        fromJsonT: (value) {
      return List<BannerItem>.from(value.map((x) => BannerItem.fromJson(x)));
    });
  }

  Future<ApiResponse<HomeArticleData>> requestArticle({int page = 1}) async {
    final currentPage = page < 1 ? 1 : page;
    return DioClient().get<HomeArticleData>(Consts.getArticleUrl(currentPage),
        fromJsonT: (value) {
      return HomeArticleData.fromJson(value);
    });
  }
}
