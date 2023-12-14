import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Top extends StatelessWidget {
  final int number;
  final int limitnumber;

  const Top({
    required this.number,
    required this.limitnumber,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF9F6BE0),
        padding: EdgeInsets.all(8),
        child:  Column(
            children: [
          Text(
            "에이미",
            style: GoogleFonts.gowunDodum(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w500
            )),
              Center(
                  child:
                  LinearPercentIndicator(
                    animation: false,
                    percent: number/limitnumber >1 ? 1:number/limitnumber,
                    //  center: Text(((number/limitnumber)*100).toStringAsFixed(1)),
                    progressColor: Colors.deepPurpleAccent,
                    backgroundColor: Colors.white,
                    barRadius: Radius.circular(20),
                  )),
        ]
        ));
  }
}
