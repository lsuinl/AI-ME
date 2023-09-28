import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF9F6BE0),
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            "에이미",
            style: GoogleFonts.notoSansKr(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w500
            )),
        ));
  }
}
