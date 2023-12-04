import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class GoResultButton extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  final String buttonText;

  const GoResultButton(
      {required this.message,
      required this.onPressed,
      required this.buttonText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) => LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xEE0537E9), Color(0xFF924CEC)],
                  ).createShader(bounds),
              child: Icon(SolarIconsBold.emojiFunnySquare, size: 35.r,)),
          SizedBox(width: 5),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(25.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xFFC4A2ED),
                    Color(0xAAFC71FF),
                  ],
                  stops: [0.2, 1],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    message,
                    style: GoogleFonts.gowunDodum(fontSize: 17.sp, color: Colors.white),
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0x77FDF8F8),
                          elevation: 0,
                          minimumSize: Size(150.w, 30.h),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      onPressed: onPressed,
                      child: Text(buttonText, style: GoogleFonts.gowunDodum(color: Color(0xFF8E35FF), fontSize: 15.sp)))
                ],
              ))
        ],
      ),
    );
  }
}
