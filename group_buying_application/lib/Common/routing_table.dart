import 'package:flutter/material.dart';
import 'package:group_buying_application/Drawer/catalog_page.dart';
import 'package:group_buying_application/Drawer/favorite_page.dart';
import 'package:group_buying_application/Drawer/member_page.dart';
import 'package:group_buying_application/Drawer/notify_page.dart';
import 'package:group_buying_application/Drawer/question_page.dart';
import 'package:group_buying_application/commodity/flying_fish_page.dart';
import 'package:group_buying_application/home_page.dart';

// 放置所有路由的地方 (大多都沒用到，但是先加入比較方便)
Map<String, WidgetBuilder> kaiRoutes = {
  "home_page": (context) => const HomePage(),
  "member_page": (context) => const MemberPage(),
  "catalog_page": (context) => const CatalogPage(),
  "notify_page": (context) => const NotifyPage(),
  "question_page": (context) => const QuestionPage(),
  "favorite_page": (context) => const FavoritePage(),
  "flyfish_page": (context) => const FlyingFishPage(),
};
