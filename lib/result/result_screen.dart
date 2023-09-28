import 'package:ai_me/common/basic.dart';
import 'package:ai_me/result/component/background.dart';
import 'package:ai_me/result/component/percentage_bar.dart';
import 'package:ai_me/result/component/replay_button.dart';
import 'package:ai_me/result/component/result_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        widgets:  Column(
              children: [
                SizedBox(height: 70.h),
                Image.asset("asset/ai_me.png", width: 250.w),
                Flexible(
                    child: ListView(
                        shrinkWrap: true,
                        children: [
                          PercentageBar(left: "I ", right: "E", percent: 0.2),
                          PercentageBar(left: "S", right: "N", percent: 0.2),
                          PercentageBar(left: "T ", right: "F", percent: 0.2),
                          PercentageBar(left: "P ", right: "J", percent: 0.2),
                          ResultContent(title: "성격", content: ""),
                          ResultContent(title: "잘 맞는 친구 유형", content: ""),
                          SizedBox(height: 20.h),
                          ReplayButton()
                        ]
                    ))
              ],
            ));
  }
}
