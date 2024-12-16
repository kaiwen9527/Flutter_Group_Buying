import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Common/floating_button.dart';
import 'package:group_buying_application/Model/float_model.dart';
import 'package:group_buying_application/Model/notify_model.dart';
import 'package:provider/provider.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget goodsNotArrive = Text(
      '等待賣家出貨中 ...',
      style: TextStyle(
          fontSize: 14.sp, color: Theme.of(context).primaryColorLight),
    );
    var notifyModel = context.watch<NotifyModel>();
    var floatModel = context.watch<FloatModel>();

    List<Widget> pageList = [
      Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5.w),
            width: 1.sw,
            color: Colors.blueGrey[300],
            child: Text(
              '公告',
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              width: 1.sw,
              height: 150.h,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    '${AnnouncementContext.dialog.first}\n${AnnouncementContext.dialog[1]}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).highlightColor),
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => const ShowDialog(),
                        );
                      },
                      child: Text(
                        '顯示更多 ..',
                        style: TextStyle(fontSize: 12.sp),
                      ))
                ],
              )),
        ],
      ),
      Image.asset(
        'images/advertise/advertise1.jpeg',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'images/advertise/advertise2.png',
        fit: BoxFit.fill,
      ),
    ];

    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: floatModel.toTopController,
            child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.campaign),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '商品通知',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Divider(),
                    Container(
                      height: 210.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight)),
                      child: SizedBox(
                          height: 1.sh,
                          child: Stack(
                            children: <Widget>[
                              PageView.builder(
                                itemCount: pageList.length,
                                controller: PageController(
                                    initialPage: notifyModel.currentPageIndex),
                                itemBuilder: (context, index) =>
                                    pageList[index],
                                onPageChanged: (value) =>
                                    notifyModel.indicatorPage(value),
                              ),
                              Positioned(
                                bottom: 10.h,
                                left: 0,
                                right: 0,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        List.generate(pageList.length, (index) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                notifyModel.currentPageIndex ==
                                                        index
                                                    ? Theme.of(context)
                                                        .indicatorColor
                                                    : Colors.grey[400]),
                                      );
                                    })),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(10.r),
                        renderBorder: false,
                        selectedColor: Colors.deepPurpleAccent[200],
                        constraints:
                            BoxConstraints(minWidth: 80.w, minHeight: 50.h),
                        onPressed: (index) {
                          notifyModel.toggleSelect(index);
                        },
                        isSelected: notifyModel.kaiIsSelected,
                        children: notifyModel.goods,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Align(
                      alignment: const Alignment(-0.7, 0.0),
                      child: Visibility(
                          visible: notifyModel.kaiIsSelected[0] == false
                              ? false
                              : true,
                          replacement: goodsNotArrive,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: 210.w,
                                height: 280.h,
                                child: Image.asset('images/noOrderYet.PNG'),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                '     尚未有訂單 ...',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                            ],
                          )),
                    ),
                  ],
                )),
          ),
          const FloatingButton(),
        ],
      ),
    );
  }
}

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Theme.of(context).primaryColor,
        surfaceTintColor: Colors.blueGrey,
        elevation: 30,
        shadowColor: Colors.blueGrey,
        shape: Border.all(width: 2.r, color: Colors.brown),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: AnnouncementContext.dialog.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    titleTextStyle: const TextStyle(color: Colors.black54),
                    title: Text(
                      AnnouncementContext.dialog[index],
                      maxLines: 2,
                    ),
                  );
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('退出'))
          ],
        ));
  }
}
