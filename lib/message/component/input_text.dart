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
TextEditingController Textcontroller = TextEditingController();
DateTime commenttime=DateTime.now();

class _InputTextState extends State<InputText> {
  FocusNode node=FocusNode();
  @override
  void initState() {
    node=FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

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
                              autofocus: true,
                              focusNode: node,
                              controller: Textcontroller,
                                onFieldSubmitted: (value){
                                  if(Textcontroller.text!=""){
                                    widget.setst();
                                    Textcontroller.clear();
                                    FocusScope.of(context).requestFocus(node);
                                  }
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  isDense: true,
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
                            if(Textcontroller.text!="" &&  (DateTime.now().difference(commenttime).inSeconds > 2)){
                              commenttime=DateTime.now();
                              widget.setst();
                              Textcontroller.clear();
                              FocusScope.of(context).requestFocus(node);
                           }
                            },
                          padding: EdgeInsets.zero,
                          icon: Icon(SolarIconsBold.mapArrowSquare, size: 40.r, color: Color(0xFFBF8DFE)))
                  )
                ]))));
  }
}
