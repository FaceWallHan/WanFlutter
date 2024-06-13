import 'package:get/get_navigation/src/routes/get_route.dart';

import '../widget/article_list_widget.dart';
import '../widget/personal/login_widget.dart';
import '../widget/personal/register_widget.dart';

class RouteUtil {
  RouteUtil._();

  ///路由表
  static List<GetPage> routeTableList = <GetPage>[
    GetPage(name: RouteAction.login.name, page: () => LoginWidget()),
    GetPage(name: RouteAction.register.name, page: () => RegisterWidget()),
    GetPage(
        name: RouteAction.articleListPage.name,
        page: () => const ArticleListPage(),
        binding: ArticleListBinding()),
  ];
}

enum RouteAction {
  login(name: '/login'),
  register(name: '/register'),
  articleListPage(name: '/articleListPage');

  const RouteAction({required this.name});

  final String name;
}
