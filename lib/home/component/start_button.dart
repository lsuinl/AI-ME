import 'package:ai_me/message/quest/post_answer_common.dart';
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
          onPressed: () async {
            dynamic check = await AnswerCommon("answer");

            if(check==true){
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            "서버점검공지",
                            style: GoogleFonts.gowunDodum(fontSize: 20.sp),
                          ),
                          content: Text(
                            "죄송합니다. 지금은 서버 점검 중입니다. \n나중에 다시 시도해주세요.",
                            style: GoogleFonts.gowunDodum(fontSize: 14.sp),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "확인",
                                style: GoogleFonts.gowunDodum(fontSize: 10.sp),
                              ),
                            ),
                          ]);
                    });
              }
            else {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => MessageScreen()), (
                      route) => false);
            }
          },
          child: Text(
            '대 화 시 작',
            style: GoogleFonts.gowunDodum(
                fontSize: 23.sp, fontWeight: FontWeight.w500),
          ),
        ));
  }
}

