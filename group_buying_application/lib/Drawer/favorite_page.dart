import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Common/floating_button.dart';
import 'package:group_buying_application/Model/catalog_model.dart';
import 'package:group_buying_application/Model/favorite_model.dart';
import 'package:group_buying_application/Model/float_model.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.speaker_notes),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '喜愛商品',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Consumer<FavoriteModel>(builder: (context, favorite, child) {
                    return Text(
                      ' (${favorite.items.length})',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Theme.of(context).primaryColorLight),
                    );
                  }),
                ],
              ),
              const Divider(),
              Expanded(
                child: _CartList(),
              ),
            ],
          ),
        ),
        const FloatingButton()
      ],
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorite = context.watch<FavoriteModel>();
    var floatModel = context.watch<FloatModel>();

    return Scrollbar(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GridView.count(
        controller: floatModel.toTopController,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 2 / 2.8,
        children: List.generate(favorite.items.length, (index) {
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: favorite.items[index].image,
                  ),
                  Text(favorite.items[index].name,
                      style: TextStyle(
                        fontSize: 11.sp,
                      )),
                  Text(
                    CatalogModel.itemPrice[index],
                    style: TextStyle(fontSize: 10.sp, color: Colors.redAccent),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          favorite.remove(favorite.items[index]);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).primaryColorLight,
                        )),
                  )
                ],
              ));
        }),
      ),
    ));
  }
}
