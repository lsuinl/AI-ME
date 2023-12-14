import 'package:ai_me/common/basic.dart';
import 'package:ai_me/common/qustion_list.dart';
import 'package:ai_me/home/home_screen.dart';
import 'package:ai_me/message/component/ai_message.dart';
import 'package:ai_me/message/component/chat_list.dart';
import 'package:ai_me/message/component/input_text.dart';
import 'package:ai_me/message/component/top.dart';
import 'package:ai_me/message/quest/post_answer_common.dart';
import 'package:ai_me/message/quest/post_answer_mbti.dart';
import 'package:ai_me/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component/go_result_button.dart';
import 'component/my_message.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Map<String, int> mbti = {'I':0,'E':0,'S':0,'N':0,'F':0,'T':0,'P':0,'J':0};
  String sumAnswer = "";
  int limitnumber = 12;
  int number = 0;
  ScrollController controller = ScrollController();
  List<Widget> widgets = [];
  List<Map<String,String>> detail_answer=[];
  List<String> mbtidetail=['IE','SN','FT','PJ'];
  bool popup=false;
  @override
  void initState() {
    widgets = [];
    widgets.add(AiMessage(message: question[number]));
    number++;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      if(popup==false) {
        popup=true;
        noticepopup();
      }
    });
    return Basic(
        widgets: Stack(children: [
          Column(
              children: [
                Top(number: number,limitnumber: limitnumber,),
                Flexible(child: ChatList(widgets: widgets))
              ]
          ),
          InputText(
            setst: setst,
          )
        ]),
        paddings: 0);
  }

  setst() async {
    String text=Textcontroller.text;

    if (number == 8) { //모든종합 질문이 끝났을 때,
      setState(() {
        widgets.add(MyMessage(message:text));
        widgets.add(AiMessage(message:question_detail[0]));
        number++;
      });
      String mbtis = await AnswerCommon(text);
      for(int i=0;i<4;i++)
        mbti[mbtis[i]]=mbti[mbtis[i]]!+1;

      sumAnswer = sumAnswer + text;
      mbtis = await AnswerCommon(sumAnswer);
      for(int i=0;i<4;i++)
        mbti[mbtis[i]]=mbti[mbtis[i]]!+6;
    }
    else if(number<8){ //종합질문중
      String mbtis = await AnswerCommon(text);
      for(int i=0;i<4;i++)
        mbti[mbtis[i]]=mbti[mbtis[i]]!+1;
      setState(() {
        widgets.add(MyMessage(message: text));
        sumAnswer = sumAnswer + text;
        widgets.add(AiMessage(message: question[number]));
        number++;
      });
    }
    else if(number>8 && number<limitnumber){ //추가질문중
      String mbtis = await AnswerMbti(mbtidetail[number-9],text);
      mbti[mbtis[0]]=mbti[mbtis[0]]!+4;
      setState(() {
        detail_answer.add(//피드백용 디테일 답변 저장하기.
            {
              "detail_mbti":mbtidetail[number-9],
              "answer":text
            }
        );
        widgets.add(MyMessage(message: text));
        widgets.add(AiMessage(message: question_detail[number-8]));
        number++;
      });
    }
    else{ //추가질문까지 모두 완료
      String mbtis = await AnswerMbti(mbtidetail[number-9],text);
      mbti[mbtis[0]]=mbti[mbtis[0]]!+4;
      setState(() {
        detail_answer.add(//피드백용 디테일 답변 저장하기.
            {
              "detail_mbti":mbtidetail[number-9],
              "answer":text
            }
        );
        widgets.add(MyMessage(message: text));
      });
      showResult();
    }
  }

  List<String> mbticheck() {
    List<String> list = [];
    number=0;
    if (mbti['I'] == mbti['E']) list.add('IE'); else if(mbti['I']==16 || mbti['E']==16) number++;
    if (mbti['S'] == mbti['N']) list.add('SN'); else if(mbti['S']==16 || mbti['N']==16) number++;
    if (mbti['T'] == mbti['F']) list.add('TF'); else if(mbti['F']==16 || mbti['T']==16) number++;
    if (mbti['P'] == mbti['J']) list.add('PJ'); else if(mbti['P']==16 || mbti['J']==16) number++;
    if(number==4) list.add('IE');
    return list;
  }

  showResult() async{
    setState(() {
      widgets.add(mbticheck().length > 1
          ? GoResultButton(
        //다시하기
          message: "당신은 예상할 수 없는 사람이네요! \n저랑 다시 대화해주세요🥹",
          onPressed: () =>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(check: false)),(route)=>false),
          buttonText: "다시 하기")
          : GoResultButton(
        //결과보기
          message: "당신이 어떤 사람인지 알겠어요!😉",
          onPressed: ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ResultScreen(mbti: mbti,content: sumAnswer,detail_list: detail_answer,)),(route)=>false),
          buttonText: "결과 보기"));
    });
  }

  noticepopup(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: Text("알아주세요!",
                style: GoogleFonts.gowunDodum(fontSize: 20.sp),),
              content: Text("에이미는 여러분의 이야기를 듣고싶어합니다!\n에이미의 질문에 최대한 자세하고 정성스러운 답변을 해주세요!\n여러분의 답변이 구체적이고 정성스러울수록 에이미도 더 열심히 여러분을 분석합니다!",
                style: GoogleFonts.gowunDodum(fontSize: 14.sp),
                ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("확인", style: GoogleFonts.gowunDodum(fontSize: 10.sp),),
                ),
              ]);
        });  }
}
