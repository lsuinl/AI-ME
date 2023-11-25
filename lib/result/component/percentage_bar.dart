import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentageBar extends StatelessWidget {
  final String left;
  final String right;
  final double percent;

  const PercentageBar(
      {required this.left,
      required this.right,
      required this.percent,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: LinearPercentIndicator(
        width: 280.w,
        animation: true,
        animationDuration: 1000,
        lineHeight: 20.h,
        leading: new Text(left, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),),
        trailing: new Text(right, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600)),
        percent: percent,
        center: Text((percent*100).toString()),
        backgroundColor: Color(0xAA9F6BE0),
        progressColor: Color(0xFF9F6BE0),
        barRadius: Radius.circular(20),
      )),
      SizedBox(height: 10.h)
    ]);
  }
}
