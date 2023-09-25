import 'package:ai_me/common/basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("asset/background.png"),
    fit: BoxFit.fill,
    ),
    ),
    child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 20.h,),
            Container(
              width: 330.w,
        height: 280.h,
        decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(30.0) //                 <--- border radius here
    )),
            child:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
              Image.asset('asset/ai_me.png',width: 150.w,),
              SizedBox(height: 10.h),
              Text("A-ME",style: GoogleFonts.lalezar(fontSize: 35.sp,fontWeight: FontWeight.w500),),
            Text("인공지능 에이미와 재미있게 대화해보고 \n성격 분석 결과를 받아보세요!",textAlign: TextAlign.center, style: GoogleFonts.gamjaFlower(fontSize: 18.sp),),
         ])   ),
        Container(
          width: 250.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(25.0) //                 <--- border radius here
              ),
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xDD9F6BE0),
                  Color(0xAAFC71FF),
                ],
              ),
            ),
            child:
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding:  EdgeInsets.all(10.0),
              ),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MessageScreen()));
              },
              child: Text('대 화 시 작', style: GoogleFonts.notoSansKr(fontSize: 23.sp,fontWeight: FontWeight.w500),),
            ))
          ])),
    );
  }
}
