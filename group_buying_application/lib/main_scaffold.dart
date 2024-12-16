import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Drawer/catalog_page.dart';
import 'package:group_buying_application/Drawer/drawer.dart';
import 'package:group_buying_application/Drawer/favorite_page.dart';
import 'package:group_buying_application/Drawer/member_page.dart';
import 'package:group_buying_application/Drawer/notify_page.dart';
import 'package:group_buying_application/Drawer/question_page.dart';
import 'package:group_buying_application/Model/favorite_model.dart';
import 'package:group_buying_application/Model/pop_scope.dart';
import 'package:group_buying_application/Model/single_model.dart';
import 'package:group_buying_application/home_page.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> openDrawerKey = GlobalKey();

  final List<Widget> pages = [
    // 用 const 是因為他們在 super 那邊都有用 const (因為還未設置任何屬性)
    // 如果設置了任何屬性了，就不用使用 const
    const HomePage(),
    const MemberPage(),
    const CatalogPage(),
    const NotifyPage(),
    const QuestionPage(),
    const FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var currentIndex = context.watch<VariousModel>();
    var badgeCount = context.watch<FavoriteModel>();
    var popscope = context.watch<PopScopeModel>();

    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (popscope.closeOnConfirm(context)) {
            // 當返回 true 時就會退出 App
            SystemNavigator.pop();
          }
        },
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[];
            },
            body: Scaffold(
              key: openDrawerKey,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                title: Text(
                  '購  Deal',
                  style: TextStyle(
                      fontSize: 28.sp,
                      color: Theme.of(context).cardColor,
                      fontStyle: FontStyle.italic),
                ),
                centerTitle: true,
                toolbarHeight: 120.h,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/bgAppbar.png',
                    fit: BoxFit.cover,
                  ),
                ),
                actions: [
                  currentIndex.loginOutPage
                      ? Badge(
                          label: Text('${badgeCount.items.length}'),
                          largeSize: 20,
                          backgroundColor: Colors.redAccent,
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            size: 36,
                            color: Theme.of(context).highlightColor,
                          ),
                        )
                      : Icon(
                          Icons.shopping_cart_sharp,
                          size: 36,
                          color: Theme.of(context).cardColor,
                        ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
              body: pages[currentIndex.currentIndex],
              drawer: const DrawerPage(),
            )));
  }
}
