import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class InputText extends StatefulWidget {
  const InputText({super.key});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Align(
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
                      child: Row(children: [
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
                      child: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: Icon(SolarIconsBold.mapArrowSquare, size: 40.r, color: Color(0xFFBF8DFE)))
                  )
                ]))));
  }
}
