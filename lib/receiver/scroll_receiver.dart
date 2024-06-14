import 'package:get/get.dart';

class ScrollReceiver extends GetxController {
  final _scrollState = true.obs;

  void updateScrollState(bool state) {
    _scrollState.value = state;
  }

  bool get state => _scrollState.value;
}
