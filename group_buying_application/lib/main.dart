import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Common/routing_table.dart';
import 'package:group_buying_application/Common/theme_data.dart';
import 'package:group_buying_application/Model/catalog_model.dart';
import 'package:group_buying_application/Model/favorite_model.dart';
import 'package:group_buying_application/Model/float_model.dart';
import 'package:group_buying_application/Model/member_model.dart';
import 'package:group_buying_application/Model/notify_model.dart';
import 'package:group_buying_application/Model/pop_scope.dart';
import 'package:group_buying_application/Model/question_model.dart';
import 'package:group_buying_application/Model/single_model.dart';
import 'package:group_buying_application/main_scaffold.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<VariousModel>(
            create: (context) => VariousModel(),
          ),
          ChangeNotifierProvider<QuestionModel>(
            create: (context) => QuestionModel(),
          ),
          ChangeNotifierProvider<NotifyModel>(
            create: (context) => NotifyModel(),
          ),
          ChangeNotifierProvider<MemberModel>(
            create: (context) => MemberModel(),
          ),
          ChangeNotifierProvider<PopScopeModel>(
            create: (context) => PopScopeModel(),
          ),
          ChangeNotifierProvider<FloatModel>(
            create: (context) => FloatModel(),
          ),
          Provider<CatalogModel>(
            create: (context) => CatalogModel(),
          ),
          ChangeNotifierProxyProvider<CatalogModel, FavoriteModel>(
            create: (context) => FavoriteModel(),
            update: (context, catalog, favorite) {
              // 主要是讓無商品的喜愛商品頁面成功加入第一件商品
              if (favorite == null) throw ArgumentError.notNull('favorite');
              favorite.catalog = catalog;
              return favorite;
            },
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(340, 1200),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter',
            theme: AppThemeData.lightMode,
            darkTheme: AppThemeData.darkMode,
            themeMode: context.watch<VariousModel>().modeSelected[1]
                ? ThemeMode.dark
                : ThemeMode.light,
            routes: kaiRoutes,
            home: const MyHomePage(),
          ),
        ));
  }
}
