import 'package:flutter/material.dart';

class NotifyModel extends ChangeNotifier {
  // 顯示更多與更少
  // bool isReadMore = false;

  // 指示器
  int currentPageIndex = 0;

  final List<bool> kaiIsSelected = [true, false];

  List<Widget> goods = <Widget>[const Text('已出貨'), const Text('未出貨')];

  // 讓文字顯示更多或更少
  // void readMoreAndLess() {
  //   isReadMore = !isReadMore;

  //   notifyListeners();
  // }

  // 指示器跟著頁面走
  void indicatorPage(int value) {
    currentPageIndex = value;

    notifyListeners();
  }

  void toggleSelect(int index) {
    // 只能選擇一個
    for (int i = 0; i < kaiIsSelected.length; i++) {
      kaiIsSelected[i] = i == index;
    }
    notifyListeners();
  }
}

class AnnouncementContext {
  static List<String> dialog = [
    '! 發文注意事項 !',
    '一、 加入的每一位團友請務必詳讀板規並且遵守。違規者管理員有權給予懲戒。',
    '二、 請於貼文第一行明確標示 9 大 hashtag #發問 #開箱 #賣家 #閒聊 #抱怨 #提醒 #分享 #交換 #贈送。',
    '三、 嚴禁在本社團內分享個人的 Line、二手賣場、社團連結等等之無相關內容，違規者一律禁言 28 天處分。',
    '四、 嚴禁筆戰、酸文、公審、無關蝦皮之相關資訊，管理員得直接刪除並給予處分。',
    '五、 /分潤文章規範/',
    '   1. 統一使用專屬分類 tag #分潤。',
    '   2. 禁止直接複製特賣商品資訊或是他人分享的情報資訊。',
    '   3. 文章中的賣場連結不能超過三個 (包括留言處)。',
    '   4. 每篇開箱文文字內容須 60 字以上、照片 2 張以上，不得使用分潤連結，如發現一律刪除。',
    '   5. 若一直重複發文或是發文格式錯誤，管理員會評估後給予停權。',
  ];
}
