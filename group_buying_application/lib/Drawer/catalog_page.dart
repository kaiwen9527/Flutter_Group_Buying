import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Common/floating_button.dart';
import 'package:group_buying_application/Common/not_logged_in.dart';
import 'package:group_buying_application/Model/catalog_model.dart';
import 'package:group_buying_application/Model/favorite_model.dart';
import 'package:group_buying_application/Model/float_model.dart';
import 'package:group_buying_application/Model/single_model.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var signOutPage = context.watch<VariousModel>();
    var floatModel = context.watch<FloatModel>();

    return signOutPage.loginOutPage
        ? Stack(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(Icons.content_copy),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '商品目錄',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Divider(),
                      Consumer<CatalogModel>(
                          builder: (context, catalog, child) {
                        return Expanded(
                            child: Scrollbar(
                                child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: GridView.count(
                            controller: floatModel.toTopController,
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 20.h,
                            childAspectRatio: 2 / 2.8,
                            children:
                                List.generate(catalog.itemLength, (index) {
                              return InkWell(
                                onTap: () {
                                  // 這裡只是先用一個示範
                                  if (CatalogModel.itemNames[index] ==
                                      'Flying Fish 飛魚餅') {
                                    Navigator.of(context)
                                        .pushNamed('flyfish_page');
                                  }
                                },
                                child: MyListItem(index),
                              );
                            }),
                          ),
                        )));
                      }),
                    ],
                  )),
              const FloatingButton(),
            ],
          )
        : const NotLoggedIn();
  }
}

class MyListItem extends StatelessWidget {
  final int index;

  const MyListItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Items>(
      (catalog) => catalog.getByPosition(index),
    );

    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColorLight)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: item.image,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(CatalogModel.itemNames[index],
                style: TextStyle(
                  fontSize: 11.sp,
                )),
            Text(
              CatalogModel.itemPrice[index],
              style: TextStyle(fontSize: 10.sp, color: Colors.redAccent),
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: 40.w,
                  height: 50.h,
                  // color: Colors.blueGrey[50],
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: Theme.of(context).hoverColor),
                  child: _AddButton(
                    item: item,
                  ),
                )),
          ],
        ));
  }
}

class _AddButton extends StatelessWidget {
  final Items item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInFavorite = context.select<FavoriteModel, bool>(
      (favorite) => favorite.items.contains(item),
    );
    return TextButton(
        onPressed: isInFavorite
            ? null
            : () {
                var favorite = context.read<FavoriteModel>();
                favorite.add(item);
              },
        child: isInFavorite
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border,
              ));
  }
}
