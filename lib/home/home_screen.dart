import 'package:ai_me/home/component/background.dart';
import 'package:ai_me/home/component/logo.dart';
import 'package:ai_me/home/component/start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  final bool check;

  const HomeScreen({required this.check, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.check == true) {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(0xFFEAD9FF),

                title: Text(
                    "저희 서비스를 이용해주셔서 감사합니다!",
                    style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                content: Text("연락처 등록 시, 추첨을 통해 \n 5명에게 스타벅스 기프티콘을 드립니다!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.sp),
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool("check", false);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color:Colors.black),
                      ),
                     ),
                  TextButton(
                      onPressed: () async {
                        moveSite();
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        prefs.setBool("check", false);
                        Fluttertoast.showToast(msg: "페이지로 이동 중입니다..");
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Color(0xFF8E35FF)),
                      ),
                     )
                ],
              );
            });
      });
    }
    return Background(
        widgets: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [SizedBox(height: 20.h), Logo(), StartButton()]));
  }

  Future<void> moveSite() async {
    Uri _url = Uri.parse("https://github.com/lsuinl");
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
