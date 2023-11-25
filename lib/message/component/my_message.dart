import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMessage extends StatelessWidget {
  final String message;

  const MyMessage({
    required this.message,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  message,
                  style: TextStyle(fontSize: 17.sp, color: Colors.white),
                ))));
  }
}
