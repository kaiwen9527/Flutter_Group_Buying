import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Model/notify_model.dart';
import 'package:group_buying_application/Model/single_model.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var drawerModel = context.watch<VariousModel>();
    var notifyModel = context.watch<NotifyModel>();

    return Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        elevation: 100,
        shadowColor: Theme.of(context).colorScheme.inverseSurface,
        width: 185.w,
        shape: Border.all(color: Colors.grey),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            drawerModel.loginOutPage
                ? UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/fiveMinutes.png'),
                            fit: BoxFit.cover)),
                    accountName: Text(
                      'kaiwen',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text(
                      'kaiwen@yahoo.com',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).disabledColor,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).primaryColorLight),
                    ),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage('images/avatar.png'),
                    ),
                    currentAccountPictureSize: Size.square(95.r),
                    arrowColor: Colors.blueGrey,
                  )
                : DrawerHeader(
                    duration: const Duration(microseconds: 200),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Center(
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Theme.of(context).primaryColorLight,
                        child: const Text('未登入'),
                      ),
                    )),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(10.r),
                selectedColor: Colors.deepPurpleAccent[200],
                constraints: BoxConstraints(minWidth: 50.w, minHeight: 60.h),
                onPressed: (index) {
                  drawerModel.toggleSelect(index);
                },
                isSelected: drawerModel.modeSelected,
                children: drawerModel.darkLightMode,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            if (drawerModel.loginOutPage == true)
              ListTile(
                contentPadding: EdgeInsets.only(left: 40.w),
                leading: const Icon(Icons.person_4_sharp),
                title: const Text('會員資料'),
                onTap: () {
                  drawerModel.onItemClick(1);
                  Navigator.of(context).pop();
                },
              ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 40.w),
              leading: const Icon(Icons.content_copy),
              title: const Text('商品目錄'),
              onTap: () {
                drawerModel.onItemClick(2);
                Navigator.of(context).pop();
              },
            ),
            if (drawerModel.loginOutPage == true)
              ListTile(
                contentPadding: EdgeInsets.only(left: 40.w),
                leading: const Icon(Icons.shopping_cart),
                title: const Text('商品通知'),
                onTap: () {
                  drawerModel.onItemClick(3);
                  Navigator.of(context).pop();
                },
              ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 40.w),
              leading: const Icon(Icons.report_problem_outlined),
              title: const Text('回報問題'),
              onTap: () {
                drawerModel.onItemClick(4);
                Navigator.of(context).pop();
              },
            ),
            if (drawerModel.loginOutPage == true)
              ListTile(
                contentPadding: EdgeInsets.only(left: 40.w),
                leading: const Icon(Icons.favorite),
                title: const Text('喜愛商品'),
                onTap: () {
                  drawerModel.onItemClick(5);
                  Navigator.of(context).pop();
                },
              ),
            if (drawerModel.loginOutPage == false)
              ListTile(
                contentPadding: EdgeInsets.only(left: 40.w),
                leading: const Icon(Icons.home_max),
                title: const Text('登入頁'),
                onTap: () {
                  drawerModel.onItemClick(0);
                  Navigator.of(context).pop();
                },
              ),
            SizedBox(
              height: 350.h,
            ),
            if (drawerModel.loginOutPage == true)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                ),
                child: TextButton(
                    onPressed: () {
                      if (drawerModel.loginOutPage = true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text('已登出')));
                        drawerModel.switchPage();
                        notifyModel.currentPageIndex = 0;
                      }
                      drawerModel.onItemClick(0);
                    },
                    child: const Text('登出')),
              ),
          ],
        ));
  }
}
