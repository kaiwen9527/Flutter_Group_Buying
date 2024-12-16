import 'package:flutter/material.dart';

class FloatModel extends ChangeNotifier {
  // 浮動按鈕初始位置
  double top = 30.0;
  double left = 30.0;

  ScrollController toTopController = ScrollController();
  bool showToTopBtn = false;

  // 利用鼠標讓漂浮按鈕能在全屏移動
  void floatingActionButton(DragUpdateDetails details) {
    left += details.delta.dx;
    top += details.delta.dy;

    notifyListeners();
  }

  // 滾動項目跑至頂部
  void showToItemBtn() {
    toTopController.addListener(() {
      print(toTopController.offset);

      // 這裡的 50 為當滾動到快接近頂部時的位置。
      // 數值越小就越接近頂部 (到 0)，反之越大離越遠
      if (toTopController.offset < 50 && showToTopBtn) {
        showToTopBtn = false;
      } else if (toTopController.offset >= 50 && showToTopBtn == false) {
        showToTopBtn = true;
      }
    });

    notifyListeners();
  }
}
