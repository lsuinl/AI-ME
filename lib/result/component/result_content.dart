import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultContent extends StatelessWidget {
  final String title;
  final String content;

  const ResultContent({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(title, style: GoogleFonts.gowunDodum(fontSize: 25.sp, fontWeight: FontWeight.w600),),
        ),
        Container(
            decoration: const BoxDecoration(
                color: Color(0xFFEAD9FF),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
          padding: EdgeInsets.all(20),
          child: Text(content, style: GoogleFonts.gowunDodum(fontWeight: FontWeight.w600,fontSize: 13.sp),)
        ),
        SizedBox(height: 10.h)
      ],
    );
  }
}
