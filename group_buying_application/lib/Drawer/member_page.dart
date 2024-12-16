import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Common/floating_button.dart';
import 'package:group_buying_application/Model/float_model.dart';
import 'package:group_buying_application/Model/member_model.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var memberModel = context.watch<MemberModel>();
    var floatModel = context.watch<FloatModel>();

    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: floatModel.toTopController,
            child: Container(
                padding: EdgeInsets.all(20.r),
                child: Form(
                    key: memberModel.kaiFormKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(Icons.person),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '會員資料',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Divider(),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '姓名',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value == '' ? null : '已儲存',
                                decoration: InputDecoration(
                                    errorStyle: const TextStyle(
                                      color: Colors.green,
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green)),
                                    constraints: BoxConstraints(
                                        maxHeight: 100.h, minHeight: 50.h),
                                    prefixIcon: const Icon(
                                        Icons.person_outline_outlined),
                                    hintText: '姓名',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.r))),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                '生日',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: memberModel.dateController,
                                validator: (value) =>
                                    value == '' ? null : '已儲存',
                                decoration: InputDecoration(
                                    errorStyle: const TextStyle(
                                      color: Colors.green,
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green)),
                                    constraints: BoxConstraints(
                                        maxHeight: 100.h, minHeight: 50.h),
                                    prefixIcon: const Icon(Icons.cake),
                                    hintText: '年 / 月 / 日',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    suffixIcon: IconButton(
                                        onPressed: () async {
                                          await showCustomDateTimePickerDialog(
                                            context: context,
                                          );
                                        },
                                        icon: const Icon(
                                            Icons.date_range_outlined))),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                '手機',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value == '' ? null : '已儲存',
                                decoration: InputDecoration(
                                    errorStyle: const TextStyle(
                                      color: Colors.green,
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green)),
                                    constraints: BoxConstraints(
                                        maxHeight: 100.h, minHeight: 50.h),
                                    prefixIcon: const Icon(Icons.phone_android),
                                    hintText: '手機',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.r))),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                '信箱',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value == '' ? null : '已儲存',
                                decoration: InputDecoration(
                                    errorStyle: const TextStyle(
                                      color: Colors.green,
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green)),
                                    constraints: BoxConstraints(
                                        maxHeight: 100.h, minHeight: 50.h),
                                    prefixIcon: const Icon(Icons.email),
                                    hintText: '信箱',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.r))),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              memberModel.kaiFormKey.currentState!.validate();
                              if (memberModel.kaiFormKey.currentState!
                                  .validate()) {
                                _showSnackBar(context);
                              }
                            },
                            child: Text(
                              '儲存',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            )),
                      ],
                    ))),
          ),
          const FloatingButton(),
        ],
      ),
    );
  }

  Future<DateTime> showCustomDateTimePickerDialog({
    required BuildContext context,
  }) async {
    return await showDialog(
      context: context,
      builder: (ctx) {
        return const Dialog(child: CustomDateTimePicker());
      },
    );
  }

  void _showSnackBar(BuildContext snb) {
    ScaffoldMessenger.of(snb).removeCurrentSnackBar();
    ScaffoldMessenger.of(snb).showSnackBar(SnackBar(
      content: const Center(
        child: Text(
          '請輸入要修改的內容',
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
      elevation: 30,
      width: 250,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
    ));
  }
}

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var memberModel = context.read<MemberModel>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker(
          initialDate: memberModel.selectDate,
          firstDate: DateTime(2000, 1, 1),
          lastDate: DateTime(2040, 12, 31),
          onDateChanged: (DateTime date) {
            memberModel.dateTimePicker(date);
          },
        ),
        ElevatedButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(memberModel.selectDate);
          },
        )
      ],
    );
  }
}
