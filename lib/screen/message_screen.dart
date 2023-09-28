import 'package:ai_me/common/basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        widgets: Stack(children: [
          Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF9F6BE0),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    "에이미",
                    style: GoogleFonts.notoSansKr(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            SizedBox(height: 10.h),
            Flexible(
                child: ListView(
              physics: ClampingScrollPhysics(),
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                //ai메세지카드
                Padding(
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
                          child: Icon(
                            SolarIconsBold.emojiFunnySquare,
                            size: 35.r,
                          )),
                      SizedBox(width: 5),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
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
                          child: Text(
                            "슬퍼하지마 숭숭숭",
                            style:
                                TextStyle(fontSize: 17.sp, color: Colors.white),
                          ))
                    ],
                  ),
                ),
                //내메세지카드
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25.0),
                                topLeft: Radius.circular(25.0),
                                bottomLeft: Radius.circular(35.0),
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
                            child: Text(
                              "슬퍼하지마 숭숭숭",
                              style: TextStyle(
                                  fontSize: 17.sp, color: Colors.white),
                            )))),
                //알수없는사람
                Padding(
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
                          child: Icon(
                            SolarIconsBold.emojiFunnySquare,
                            size: 35.r,
                          )),
                      SizedBox(width: 5),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
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
                                "당신은 예상할 수 없는 사람이네요! \n저랑 다시 대화해주세요🥹",
                                style: TextStyle(
                                    fontSize: 17.sp, color: Colors.white),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                  primary: Color(0x77FDF8F8),
                                  elevation: 0,
                                  minimumSize: Size(150.w, 30.h),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                                  onPressed: () {},
                                  child: Text(
                                    "결과 보기",
                                    style: TextStyle(color: Color(0xFF8E35FF),fontSize: 15.sp),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
                //결과보기
                Padding(
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
                          child: Icon(
                            SolarIconsBold.emojiFunnySquare,
                            size: 35.r,
                          )),
                      SizedBox(width: 5),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
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
                                "당신이 어떤 사람인지 알겠어요!😉",
                                style: TextStyle(
                                    fontSize: 17.sp, color: Colors.white),
                              ),
                              SizedBox(height: 10.h),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0x77FDF8F8),
                                  elevation: 0,
                                  minimumSize: Size(150.w, 30.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  )
                                ),
                                  onPressed: () {},
                                  child: Text("다시 하기",
                                      style:
                                          TextStyle(color: Color(0xFF8E35FF),fontSize: 15.sp)))
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ))
          ]),
          //입력창
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFBF8DFE)), //테두리,
                      ),
                      child: Row(children: [
                        SizedBox(width: 10.w),
                        Container(
                            width: 290.w,
                            height: 35.h,
                            child: Row(
                                children: [
                              Flexible(
                                  child: TextFormField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                      )))
                            ])),
                        Container(
                            padding: const EdgeInsets.all(0.0),
                            width: 30.0,
                            // you can adjust the width as you need
                            child: IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  SolarIconsBold.mapArrowSquare,
                                  size: 40.r,
                                  color: Color(0xFFBF8DFE),
                                )))
                      ]))))
        ]),
        paddings: 0);
  }
}