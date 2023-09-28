import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330.w,
        height: 280.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'asset/ai_me.png',
            width: 150.w,
          ),
          SizedBox(height: 10.h),
          Text(
            "A-ME",
            style: GoogleFonts.lalezar(fontSize: 35.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            "인공지능 에이미와 재미있게 대화해보고 \n성격 분석 결과를 받아보세요!",
            textAlign: TextAlign.center,
            style: GoogleFonts.gamjaFlower(fontSize: 18.sp),
          ),
        ]));
  }
}
