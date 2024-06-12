import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../entity/banner_item.dart';

class BannerBody extends StatelessWidget {
  final _isCurrentBanner = 0.obs;

  final List<BannerItem> data;

  final CarouselController _controller = CarouselController();

  BannerBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double bannerHeight = screenWidth * 500 / 900;
    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: bannerHeight,
          child: Stack(
            children: [
              CarouselSlider.builder(
                itemCount: data.length,
                itemBuilder: (_, int index, real) {
                  return _getBannerItem(data[index], screenWidth);
                },
                options: _getBannerOption(screenWidth, bannerHeight),
                carouselController: _controller,
              )
            ],
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: data.asMap().entries.map((item) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(item.key),
                  child: _getPositionPoint(context, item),
                );
              }).toList(),
            ))
      ],
    );
  }

  /// Banner的点
  Obx _getPositionPoint(BuildContext context, MapEntry<int, BannerItem> item) {
    final color = (Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black);
    return Obx(() {
      return Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
                .withOpacity((_isCurrentBanner.value == item.key) ? 0.9 : 0.2)),
      );
    });
  }

  ///Banner的Item
  Stack _getBannerItem(BannerItem item, double screenWidth) => Stack(
        children: [
          Image.network(
            item.imagePath,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.black.withOpacity(0.5),
              height: 25,
              width: screenWidth,
              child: Text(
                item.title,
                style: const TextStyle(
                    color: Colors.white, fontStyle: FontStyle.normal),
              ),
            ),
          )
        ],
      );

  /// Banner的设置
  CarouselOptions _getBannerOption(double screenWidth, double bannerHeight) =>
      CarouselOptions(
          onPageChanged: (int index, CarouselPageChangedReason reason) {
            _isCurrentBanner.value = index;
          },
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          viewportFraction: 1.0,
          height: bannerHeight,
          aspectRatio: 9 / 5);
}
