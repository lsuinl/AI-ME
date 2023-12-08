import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentageBar extends StatelessWidget {
  final String left;
  final String right;
  final double percent;
  final double graph;

  const PercentageBar(
      {required this.left,
      required this.right,
      required this.percent,
        required this.graph,
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
        leading: Container(
          alignment: Alignment.center,
          width: 20.h,
        child: Text(left, style: GoogleFonts.lalezar(fontSize: 30.sp, fontWeight: FontWeight.w500)),),

        trailing: new Text(right, style: GoogleFonts.lalezar(fontSize: 30.sp, fontWeight: FontWeight.w500)),
        percent: graph,
        center: Text((percent*100).toStringAsFixed(2),style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
        backgroundColor: Colors.blueAccent,
        progressColor: Color(0xFF9F6BE0),
        barRadius: Radius.circular(20),
      )),
      SizedBox(height: 10.h)
    ]);
  }
}
