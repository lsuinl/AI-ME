import 'package:ai_me/home/home_screen.dart';
import 'package:ai_me/message/message_screen.dart';
import 'package:ai_me/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
      ScreenUtilInit(designSize: Size(360, 690),
  builder:(context,child) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }));
  }