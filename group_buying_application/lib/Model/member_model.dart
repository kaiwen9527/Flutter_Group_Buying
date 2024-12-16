import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class MemberModel extends ChangeNotifier {
  final kaiFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();

  DateTime? selectDate;

  void dateTimePicker(DateTime date) {
    selectDate = date;
    dateController.text = formatDate(selectDate!, [yyyy, '/', mm, '/', dd]);
    // print(formatDate(DateTime.now(), [yyyy, '/', mm, '/', dd]));

    notifyListeners();
  }
}
