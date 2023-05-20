import 'package:guxin_ai/common/store/content.dart';
import 'package:guxin_ai/pages/bbs/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BbsController extends GetxController with GetSingleTickerProviderStateMixin {
  BbsController();
  final state = BbsState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    state.tabController = TabController(length: state.tabs.length, vsync: this);
    state.pageController = PageController(initialPage: state.curPage);
    state.indexScrollController.addListener(() {
      if (state.indexScrollController.position.pixels == state.indexScrollController.position.maxScrollExtent) {
        state.indexDownloading.value = true;
        ContentStore.to.getContents(isNext: true, complete: () => state.indexDownloading.value = false);
      }
    });
    super.onInit();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
