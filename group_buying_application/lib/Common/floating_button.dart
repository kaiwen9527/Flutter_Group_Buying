import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_buying_application/Model/float_model.dart';
import 'package:provider/provider.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    var floatModel = context.watch<FloatModel>();

    return Positioned(
        left: floatModel.left,
        top: floatModel.top,
        child: GestureDetector(
            onPanUpdate: (details) {
              floatModel.floatingActionButton(details);
            },
            child: FloatingActionButton(
              onPressed: () {
                floatModel.toTopController.animateTo(0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
              elevation: 20,
              highlightElevation: 50,
              backgroundColor: Colors.black54,
              splashColor: Colors.blueGrey[400],
              tooltip: '可拖曳',
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r)),
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.black26,
                child: CircleAvatar(
                  radius: 23.r,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            )));
  }
}
