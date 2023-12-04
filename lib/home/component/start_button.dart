import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../message/message_screen.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.w,
        decoration: const BoxDecoration(
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
          onPressed: () =>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MessageScreen()),(route)=>false),
          child: Text(
            '대 화 시 작',
            style: GoogleFonts.gowunDodum(fontSize: 23.sp, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
