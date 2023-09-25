import 'package:ai_me/screen/home_screen.dart';
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