import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Model/single_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homeModel = context.watch<VariousModel>();

    // 這裡假設是已經註冊好的使用者名稱與密碼
    String user = 'kaiwen';
    String password = '20241215';

    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: homeModel.kaiFormKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.person), hintText: '使用者名稱..'),
                          validator: (value) {
                            if (value == user) {
                              return null;
                            } else {
                              return '名稱錯誤';
                            }
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.lock_outline), hintText: '密碼..'),
                          obscureText: true,
                          validator: (value) {
                            return value == password ? null : '密碼錯誤';
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        if (homeModel.kaiFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('登入成功 !!!')));
                          homeModel.switchPage();
                          homeModel.onItemClick(1);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            '登入失敗 ~~',
                            style: TextStyle(color: Colors.redAccent),
                          )));
                        }
                      },
                      child: const Text('登入')),
                ],
              )),
        ]));
  }
}
