import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotLoggedIn extends StatelessWidget {
  const NotLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 250.w,
            height: 400.h,
            child: Image.asset(
              'images/未登入顯示圖片.webp',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            '請先登入 !!!',
            style: TextStyle(
                fontSize: 24.sp, color: Theme.of(context).primaryColorLight),
          )
        ],
      ),
    );
  }
}
