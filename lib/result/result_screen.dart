import 'package:ai_me/common/result_list.dart';
import 'package:ai_me/result/component/background.dart';
import 'package:ai_me/result/component/percentage_bar.dart';
import 'package:ai_me/result/component/replay_button.dart';
import 'package:ai_me/result/component/result_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, int> mbti;
  final String content;
  final List<Map<String, String>> detail_list;

  const ResultScreen(
      {required this.mbti,
      required this.content,
      required this.detail_list,
      super.key});

  @override
  Widget build(BuildContext context) {
    String mbtis = mbtiresult();
    return Background(
        widgets: Column(
      children: [
        Flexible(
            child: Stack(children: [
          Column(
            children: [
              Container(height: 210.h),
              Flexible(
                  child: ListView(shrinkWrap: true, children: [
                PercentageBar(
                  left: "I ",
                  right: "E",
                  graph: mbti['I']!/(mbti['I']! + mbti['E']!),
                  percent: mbti[mbtis[0]]!/(mbti['I']! + mbti['E']!)),
                PercentageBar(
                    left: "S",
                    right: "N",
                    graph: mbti['S']!/(mbti['S']! + mbti['N']!),
                    percent: mbti[mbtis[1]]!/(mbti['S']! + mbti['N']!)),
                PercentageBar(
                    left: "T ",
                    right: "F",
                    graph:mbti['T']!/(mbti['T']! + mbti['F']!),
                    percent:  mbti[mbtis[2]]!/(mbti['T']! + mbti['F']!)),
                PercentageBar(
                    left: "P ",
                    right: "J",
                    graph:mbti['P']!/(mbti['P']! + mbti['J']!),
                    percent: mbti[mbtis[3]]!/(mbti['P']! + mbti['J']!)),
                ResultContent(title: "성격", content: MBTI_main[mbtis]!),
                ResultContent(title: "장점 및 특기", content: MBTI_strong[mbtis]!),
                ResultContent(title: "직업 추천", content: MBTI_job[mbtis]!),
                ResultContent(
                    title: "스트레스 관리 방법", content: MBTI_stress[mbtis]!),
                ResultContent(title: "잘 맞는 친구 유형", content: MBTI_other[mbtis]!),
                SizedBox(height: 20.h),
                ReplayButton(
                    mbtis: mbtis,
                    content: content,
                    detail_answer: DetailAnswerResult(detail_list, mbtis)),
              ]))
            ],
          ),
          Column(
            children: [
              Container(
                height: 40.h,
              ),
              Container(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 5,
                      child: Image.asset(
                    'asset/${mbtis}.png',
                    height: 180.h,
                  )))
            ],
          ),
          Container(
              alignment: Alignment.topCenter,
              child: Text(mbtis,
                  style: GoogleFonts.lalezar(
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFC4A2EF),
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(8.0, 5.0),
                        blurRadius: 0.5,
                        color: Color(0xFF612BA4)
                      ),
                    ],))),
        ]))
      ],
    ));
  }

  String mbtiresult() {
    String mbtis = "";
    if (mbti['I']! > mbti['E']!)
      mbtis += "I";
    else
      mbtis += "E";
    if (mbti['S']! > mbti['N']!)
      mbtis += "S";
    else
      mbtis += "N";
    if (mbti['T']! > mbti['F']!)
      mbtis += "T";
    else
      mbtis += "F";
    if (mbti['P']! > mbti['J']!)
      mbtis += "P";
    else
      mbtis += "J";

    return mbtis;
  }

  List<Map<String, String>> DetailAnswerResult(
      List<Map<String, String>> answer, String mbtis) {
    for (int i = 0; i < answer.length; i++) {
      if (answer[i]['detail_mbti']!.contains(mbtis[0].toString()))
        answer[i]['detail_mbti'] = mbtis[0].toString();
      else if (answer[i]['detail_mbti']!.contains(mbtis[1].toString()))
        answer[i]['detail_mbti'] = mbtis[1].toString();
      else if (answer[i]['detail_mbti']!.contains(mbtis[2].toString()))
        answer[i]['detail_mbti'] = mbtis[2].toString();
      else
        answer[i]['detail_mbti'] = mbtis[3].toString();
    }
    return answer;
  }
}
