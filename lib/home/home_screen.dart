import 'package:ai_me/home/component/background.dart';
import 'package:ai_me/home/component/logo.dart';
import 'package:ai_me/home/component/start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        widgets: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.h),
              Logo(),
              StartButton()
            ]
        )
    );
  }
}
