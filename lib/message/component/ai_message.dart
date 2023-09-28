import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class AiMessage extends StatelessWidget {
  const AiMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
}
