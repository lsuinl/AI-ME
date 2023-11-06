import 'package:ai_me/message/component/my_message.dart';
import 'package:ai_me/message/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class InputText extends StatefulWidget {
  final VoidCallback setst;

  const InputText({
    required this.setst,
    super.key});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  TextEditingController Textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                              controller: Textcontroller,
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
                          onPressed: () {
                            if(Textcontroller.text!=""){
                            setState(() {
                              widgets.add(
                                  MyMessage(
                                      message: Textcontroller.text
                                  )
                              );
                              Textcontroller.clear();
                            });
                            widget.setst();
                          }},
                          padding: EdgeInsets.zero,
                          icon: Icon(SolarIconsBold.mapArrowSquare, size: 40.r, color: Color(0xFFBF8DFE)))
                  )
                ]))));
  }
}
