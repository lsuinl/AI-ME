import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultContent extends StatelessWidget {
  final String title;
  final String content;

  const ResultContent({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(title, style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),),
        ),
        Container(
            height: 150.h,
            decoration: const BoxDecoration(
                color: Color(0xFFEAD9FF),
                borderRadius: BorderRadius.all(Radius.circular(30.0))
            )),
        SizedBox(height: 10.h)
      ],
    );
  }
}
