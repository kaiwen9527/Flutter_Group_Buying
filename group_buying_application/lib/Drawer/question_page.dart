import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Common/floating_button.dart';
import 'package:group_buying_application/Common/not_logged_in.dart';
import 'package:group_buying_application/Model/float_model.dart';
import 'package:group_buying_application/Model/question_model.dart';
import 'package:group_buying_application/Model/single_model.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var questionModel = context.watch<QuestionModel>();
    var signOutPage = context.watch<VariousModel>();
    var floatModel = context.watch<FloatModel>();
    int dropDownMenu = 0;

    return signOutPage.loginOutPage
        ? SizedBox(
            width: 1.sh,
            height: 1.sh,
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  controller: floatModel.toTopController,
                  child: Container(
                      padding: EdgeInsets.all(20.r),
                      child: Form(
                          key: questionModel.kaiFormKey,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.speaker_notes),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    '回報問題',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const Divider(),
                              Container(
                                padding: EdgeInsets.all(20.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '姓名',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value != '') {
                                          return null;
                                        } else {
                                          return '請輸入姓名';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          constraints: const BoxConstraints(
                                              maxHeight: 200),
                                          hintText: '輸入你的姓名',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.r))),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    Text(
                                      '問題類型',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    DropdownMenu(
                                      hintText: '選擇問題的類型..',
                                      menuStyle: MenuStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Theme.of(context)
                                                      .primaryColor)),
                                      width: 1.sw,
                                      onSelected: (v) {
                                        dropDownMenu = v!;
                                      },
                                      dropdownMenuEntries: const [
                                        DropdownMenuEntry(
                                            value: 1, label: '網頁'),
                                        DropdownMenuEntry(
                                            value: 2, label: '商品'),
                                        DropdownMenuEntry(
                                            value: 3, label: '外部資訊'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    Text(
                                      '問題',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        return value != '' ? null : '請輸入問題';
                                      },
                                      decoration: InputDecoration(
                                          constraints: const BoxConstraints(
                                              maxHeight: 200),
                                          hintText: '你好，請問有什麼問題呢 ?',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.r))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 120.h,
                              ),
                              Center(
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (questionModel.kaiFormKey.currentState!
                                              .validate() &&
                                          dropDownMenu != 0) {
                                        ScaffoldMessenger.of(context)
                                            .removeCurrentSnackBar();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: const Center(
                                            child: Text(
                                              '已送出，謝謝你的建議!',
                                            ),
                                          ),
                                          elevation: 30,
                                          width: 250,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.r))),
                                          duration: const Duration(seconds: 3),
                                          behavior: SnackBarBehavior.floating,
                                          showCloseIcon: true,
                                        ));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .removeCurrentSnackBar();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: const Center(
                                            child: Text(
                                              '請完整輸入，謝謝。',
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ),
                                          ),
                                          elevation: 30,
                                          width: 250,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.r))),
                                          duration: const Duration(seconds: 3),
                                          behavior: SnackBarBehavior.floating,
                                          showCloseIcon: true,
                                        ));
                                      }
                                    },
                                    child: Text(
                                      '送出',
                                      style: TextStyle(fontSize: 16.sp),
                                    )),
                              ),
                            ],
                          ))),
                ),
                const FloatingButton(),
              ],
            ),
          )
        : const NotLoggedIn();
  }
}
