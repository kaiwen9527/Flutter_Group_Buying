import 'package:flutter/material.dart';

class QuestionModel extends ChangeNotifier {
  // DropdownMenu
  int dropDownMenu = 0;
  final kaiFormKey = GlobalKey<FormState>();

  // 下滑式選單的選擇
  // void menuSelect(int v) {
  //   dropDownMenu = v;

  //   notifyListeners();
  // }
}
