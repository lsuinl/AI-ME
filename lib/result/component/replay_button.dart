import 'package:ai_me/home/home_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ReplayButton extends StatefulWidget {
  final String mbtis;

  const ReplayButton({
    required this.mbtis,
    super.key});

  @override
  State<ReplayButton> createState() => _ReplayButtonState();
}

class _ReplayButtonState extends State<ReplayButton> {
  final _mbti = [
    'INTJ',
    'INTP',
    'ENTJ',
    'ENTP',
    'INFJ',
    'INFP',
    'ENFJ',
    'ENFP',
    'ISTJ',
    'ISFJ',
    'ESTJ',
    'ESFJ',
    'ISTP',
    'ISFP',
    'ESTP',
    'ESFP'
  ];
  late String _selectedmbti;
  @override
  void initState() {
    _selectedmbti=widget.mbtis;
    super.initState();
  }
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
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: true,
                // 바깥 영역 터치시 닫을지 여부
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor:  Color(0xFFEAD9FF),
                    content: Text(
                      "실제 MBTI와 동일한 결과였나요?\n여러분의 mbti를 알려주세요!",
                      style:
                          TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: DropdownButtonHideUnderline(
                  child:  DropdownButton2<String>(

                      isExpanded: true,
                            alignment: AlignmentDirectional.topStart,
                            value: _selectedmbti,
                            items: _mbti
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedmbti = value!;
                              });
                            }, buttonStyleData:  ButtonStyleData(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3.w,color: Color(0xFFCFCFCF))
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 140,
                  ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                    ),
                  ))),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 50),child:
                      TextButton(
                          onPressed: () async {
                            Fluttertoast.showToast(msg: "응답해주셔서 감사합니다!");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Text(
                            "제출",
                            style: Theme.of(context).textTheme.labelSmall!,
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.black54,
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xFFCFCFCF),
                              width: 3.w,
                            ),
                          )))
                          ])
                    ],

                  );
                });
          },
          child: Text(
            '다시 테스트하기',
            style: GoogleFonts.notoSansKr(
                fontSize: 23.sp, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
