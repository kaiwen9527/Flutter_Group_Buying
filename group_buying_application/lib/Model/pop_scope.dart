import 'package:flutter/material.dart';

class PopScopeModel extends ChangeNotifier {
  DateTime? currentBackPressTime;

  bool closeOnConfirm(BuildContext context) {
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        // 這裡是過了 4 秒後的時間 - 目前時間 > 4 秒 (就是有 4 秒時間可以考慮是否確定退出)
        now.difference(currentBackPressTime!) > const Duration(seconds: 4)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text('再次按下使應用程序退出至主畫面'),
        ),
        duration: Duration(seconds: 4),
      ));
      return false;
    }
    // 4 秒內再次按返回按鈕就返回 true
    return true;
  }
}
