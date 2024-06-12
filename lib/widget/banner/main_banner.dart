import 'package:flutter/material.dart';
import 'package:wan_android/widget/banner/banner_body.dart';
import 'package:wan_android/viewmodel/home_view_model.dart';
import 'package:wan_android/widget/base/loading_widget.dart';

import '../../entity/banner_item.dart';
import '../../entity/base_response.dart';

class MainBanner extends StatelessWidget {
  MainBanner({super.key});

  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double bannerHeight = screenWidth * 500 / 900;
    return LoadingWidget<ApiResponse<List<BannerItem>>>(
      future: viewModel.requestBanner(),
      childBuilder: (BuildContext context,
          AsyncSnapshot<ApiResponse<List<BannerItem>>> snapshot) {
        return BannerBody(data: snapshot.data!.data);
      },
      loadingWidgetBuilder: (context, snapshot) {
        return SizedBox(
          height: bannerHeight,
          width: screenWidth,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
