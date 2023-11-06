import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:solar_icons/solar_icons.dart';

class AiMessage extends StatefulWidget {
  const AiMessage({super.key});

  @override
  State<AiMessage> createState() => _AiMessageState();
}

class _AiMessageState extends State<AiMessage> {
  bool loading=true;
  @override
  void initState() {
    waiting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: loading==true ?[
          ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) => LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xEE0537E9), Color(0xFF924CEC)],
              ).createShader(bounds),
              child: Icon(SolarIconsBold.emojiFunnySquare, size: 35.r,)),
          SizedBox(width: 10),
        Container(
              width:MediaQuery.of(context).size.height/9,
              height: MediaQuery.of(context).size.height/14,
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xFFC4A2ED),
                size: 60,
              ))
        ]:[
          ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) => LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xEE0537E9), Color(0xFF924CEC)],
                  ).createShader(bounds),
              child: Icon(SolarIconsBold.emojiFunnySquare, size: 35.r,)),
          SizedBox(width: 5),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              child: Text("슬퍼하지마 숭숭숭", style: TextStyle(fontSize: 17.sp, color: Colors.white),))
        ],
      ),
    );
  }
  void waiting() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      loading=false;
    });
  }
}
