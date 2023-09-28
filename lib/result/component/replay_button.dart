import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReplayButton extends StatelessWidget {
  const ReplayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xDD9F6BE0),
              Color(0xAAFC71FF),
            ],
          ),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(10.0),
          ),
          onPressed: () {},
          child: Text('다시 테스트하기', style: GoogleFonts.notoSansKr(fontSize: 23.sp, fontWeight: FontWeight.w500),),
        ));
  }
}
