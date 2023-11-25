import 'package:ai_me/result/component/background.dart';
import 'package:ai_me/result/component/percentage_bar.dart';
import 'package:ai_me/result/component/replay_button.dart';
import 'package:ai_me/result/component/result_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, int> mbti;

  const ResultScreen({
    required this.mbti,
  super.key});

  @override
  Widget build(BuildContext context) {
    String mbtis=mbtiresult();
    return Background(
        widgets:  Column(
              children: [
                Text(mbtis,style: TextStyle(fontSize: 30.sp)),
                SizedBox(height: 70.h),
                Image.asset("asset/ai_me.png", width: 250.w),
                Flexible(
                    child: ListView(
                        shrinkWrap: true,
                        children: [
                          PercentageBar(left: "I ", right: "E", percent:(mbti['I']!+mbti['E']!)/mbti['I']!,),
                          PercentageBar(left: "S", right: "N", percent: (mbti['I']!+mbti['E']!)/mbti['I']!),
                          PercentageBar(left: "T ", right: "F", percent: (mbti['I']!+mbti['E']!)/mbti['I']!),
                          PercentageBar(left: "P ", right: "J", percent: (mbti['I']!+mbti['E']!)/mbti['I']!),
                          ResultContent(title: "성격", content: ""),
                          ResultContent(title: "잘 맞는 친구 유형", content: ""),
                          SizedBox(height: 20.h),
                          ReplayButton()
                        ]
                    ))
              ],
            ));
  }

  String mbtiresult(){
    String mbtis="";
    if(mbti['I']!>mbti['E']!) mbtis+="I";
    else mbtis+="E";
    if(mbti['S']!>mbti['N']!) mbtis+="S";
    else mbtis+="N";
    if(mbti['T']!>mbti['F']!) mbtis+="T";
    else mbtis+="F";
    if(mbti['P']!>mbti['J']!) mbtis+="P";
    else mbtis+="J";

    return mbtis;
  }
}
