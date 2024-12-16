import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlyingFishPage extends StatelessWidget {
  const FlyingFishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                title: TextField(
                  decoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 45),
                      prefixIcon: const Icon(Icons.search),
                      hintText: '飛魚餅',
                      hintStyle: TextStyle(color: Theme.of(context).hintColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r))),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      )),
                ],
                forceElevated: true,
                elevation: 50,
                shadowColor: Colors.deepPurpleAccent,
                titleSpacing: 5.w,
                expandedHeight: 450.h,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/product/flyingFish.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(20.r),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 220.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '| 台東特產 飛魚餅 (80g/100g) 台東農漁會精選 鹹餅乾 魚餅 飛魚餅乾 |',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            Text(
                              r'$80 - $95',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.redAccent),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '已出售 1,507',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.share,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.message_rounded,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                        )),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '賣場優惠卷',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 50.h,
                              width: 80.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  const Text(
                                    '8.8 折',
                                    style: TextStyle(
                                      backgroundColor: Colors.orangeAccent,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 21,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ))
                                ],
                              ))
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '分期 0 利率',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 50.h,
                              width: 150.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    r'6 期 x $17 (0 利率)',
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 21,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ))
                                ],
                              ))
                        ],
                      ),
                      const Divider(),
                      SizedBox(
                        height: 120.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.fire_truck_outlined,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                    Text(
                                      r' 運費: $45 - $100',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.fire_truck,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                    Text(
                                      r' 滿 $999，免運費',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Theme.of(context).primaryColorLight,
                                ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 170.h,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10.h),
                                leading: CircleAvatar(
                                  radius: 60.r,
                                  backgroundImage:
                                      const AssetImage('images/皮老闆.jpeg'),
                                ),
                                title: const Text(
                                  '美食生活 - 信用批發專家 Kai',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                trailing: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.redAccent)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '逛賣場',
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 60.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text.rich(
                                      textAlign: TextAlign.center,
                                      TextSpan(children: [
                                        TextSpan(
                                            text: '4.9\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.sp)),
                                        TextSpan(
                                            text: '評價',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp)),
                                      ])),
                                  const VerticalDivider(
                                    color: Colors.grey,
                                  ),
                                  Text.rich(
                                      textAlign: TextAlign.center,
                                      TextSpan(children: [
                                        TextSpan(
                                            text: '278\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.sp)),
                                        TextSpan(
                                            text: '商品',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp)),
                                      ])),
                                  const VerticalDivider(
                                    color: Colors.grey,
                                  ),
                                  Text.rich(
                                      textAlign: TextAlign.center,
                                      TextSpan(children: [
                                        TextSpan(
                                            text: '98% \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.sp)),
                                        TextSpan(
                                            text: '聊聊回應',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp)),
                                      ])),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      DataTable(columnSpacing: 130, columns: [
                        DataColumn(
                            label: Text(
                              '商品詳情',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                            headingRowAlignment: MainAxisAlignment.center),
                        const DataColumn(
                          label: Text(
                            '',
                          ),
                        ),
                      ], rows: [
                        DataRow(cells: [
                          DataCell(Text(
                            '品牌',
                            style: TextStyle(fontSize: 14.sp),
                          )),
                          DataCell(Text(
                            'kai 食品',
                            style: TextStyle(fontSize: 14.sp),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            '產地',
                            style: TextStyle(fontSize: 14.sp),
                          )),
                          DataCell(Text(
                            '台灣',
                            style: TextStyle(fontSize: 14.sp),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            '食物種類',
                            style: TextStyle(fontSize: 14.sp),
                          )),
                          DataCell(Text(
                            '其他',
                            style: TextStyle(fontSize: 14.sp),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            '出貨地',
                            style: TextStyle(fontSize: 14.sp),
                          )),
                          DataCell(Text(
                            '屏東市民生路',
                            style: TextStyle(fontSize: 14.sp),
                          )),
                        ]),
                      ]),
                      const Divider(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30.h,
                            ),
                            Image.asset(
                              'images/flyingFish/flyingFish_ad.jpg',
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.check,
                                  color: Colors.redAccent,
                                ),
                                Text(
                                  '台東米、魚漿含量 45 %',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.check,
                                  color: Colors.redAccent,
                                ),
                                Text(
                                  '選用上等的魚漿',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.check,
                                  color: Colors.redAccent,
                                ),
                                Text(
                                  '全台首創的飛魚餅，台東必買伴手禮',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'No ',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 14.sp)),
                              TextSpan(
                                  text: '糖精',
                                  style: TextStyle(fontSize: 14.sp)),
                              TextSpan(
                                  text: ' No ',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 14.sp)),
                              TextSpan(
                                  text: '防腐劑',
                                  style: TextStyle(fontSize: 14.sp)),
                              TextSpan(
                                  text: ' No ',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 14.sp)),
                              TextSpan(
                                  text: '色素',
                                  style: TextStyle(fontSize: 14.sp)),
                            ])),
                            Text(
                              '一款健康又好吃的超涮嘴零食 ~',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
