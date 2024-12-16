import 'package:flutter/material.dart';

class VariousModel extends ChangeNotifier {
  // 登入前與登入後的畫面顯示
  bool loginOutPage = false;

  final kaiFormKey = GlobalKey<FormState>();

  // 日夜切換
  List<Widget> darkLightMode = <Widget>[
    const Icon(Icons.brightness_5),
    const Icon(Icons.bedtime),
  ];
  final List<bool> modeSelected = [true, false];

  // Drawer 的分頁頁面
  int currentIndex = 0;

  // 登入與登出時兩種狀態
  void switchPage() {
    loginOutPage = !loginOutPage;

    notifyListeners();
  }

  // 日夜切換的部分
  void toggleSelect(int index) {
    for (int i = 0; i < modeSelected.length; i++) {
      modeSelected[i] = i == index;
    }
    notifyListeners();
  }

  // Drawer 的頁面切換
  void onItemClick(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
