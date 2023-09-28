import 'package:ai_me/common/basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("asset/result_bac.jpg"),
    fit: BoxFit.fill,
    ),
    ),
    child: Padding(
      padding: EdgeInsets.all(15),
      child:Column(
      children: [
        SizedBox(height: 70.h),
        Image.asset("asset/ai_me.png", width: 250.w),
        Flexible(
            child: ListView(
            shrinkWrap: true,
          children:[
            Center(
              child: LinearPercentIndicator(
                width: 280.w,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.h,
                leading: new Text("I ",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600),),
                trailing: new Text("E",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600)),
                percent: 0.2,
                center: Text("80.0%"),
                backgroundColor: Color(0xAA9F6BE0),
                progressColor: Color(0xFF9F6BE0),
                barRadius: Radius.circular(20),
              )
            ),
            SizedBox(height: 10.h),
            Center(
                child: LinearPercentIndicator(
                  width: 280.w,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20.h,
                  leading: new Text("S",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600)),
                  trailing: new Text("N",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600)),
                  percent: 0.2,
                  center: Text("80.0%"),
                  backgroundColor: Color(0xAA9F6BE0),
                  progressColor: Color(0xFF9F6BE0),
                  barRadius: Radius.circular(20),
                )
            ),
            SizedBox(height: 10.h),
            Center(
                child: LinearPercentIndicator(
                  width: 280.w,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20.h,
                  leading: new Text("T",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600)),
                  trailing: new Text("F",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600)),
                  percent: 0.2,
                  center: Text("80.0%"),
                  backgroundColor: Color(0xAA9F6BE0),
                  progressColor: Color(0xFF9F6BE0),
                  barRadius: Radius.circular(20),
                )
            ),
            SizedBox(height: 10.h),
            Center(
                child: LinearPercentIndicator(
                  width: 280.w,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20.h,
                  leading: new Text("P",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600)),
                  trailing: new Text("J",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600)),
                  percent: 0.2,
                  center: Text("80.0%"),
                  backgroundColor: Color(0xAA9F6BE0),
                  progressColor: Color(0xFF9F6BE0),
                  barRadius: Radius.circular(20),
                )
            ),
            SizedBox(height: 30.h),
        Container(
          alignment: Alignment.centerLeft,
          child:   Text("성격",style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w600),),
        ),
        Container(
          height: 150.h,
          decoration: const BoxDecoration(
              color: Color(0xFFEAD9FF),
              borderRadius: BorderRadius.all(
                  Radius.circular(30.0) //                 <--- border radius here
              ))
        ),
        Container(
          alignment: Alignment.centerLeft,
          child:   Text("잘 맞는 친구 유형",style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w600),),
        ),
        Container(
            height: 150.h,
            decoration: const BoxDecoration(
                color: Color(0xFFEAD9FF),
                borderRadius: BorderRadius.all(
                    Radius.circular(30.0) //                 <--- border radius here
                ))
        ),
            SizedBox(height: 20.h),
            Container(
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(25.0)
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xDD9F6BE0),
                      Color(0xAAFC71FF),
                    ],
                  ),
                ),
                child:
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding:  EdgeInsets.all(10.0),
                  ),
                  onPressed: (){},
                  child: Text('다시 테스트하기', style: GoogleFonts.notoSansKr(fontSize: 23.sp,fontWeight: FontWeight.w500),),
                )
            ),
          ])
        )
      ],
    )
    )));
  }
}
