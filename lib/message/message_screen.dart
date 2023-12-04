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

import 'component/go_result_button.dart';
import 'component/my_message.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Map<String, int> mbti = {'I':0,'E':0,'S':0,'N':0,'F':0,'T':0,'P':0,'J':0};
  List<List<String>> lackQuestion=[];
  String sumAnswer = "";
  int limitnumber = 12;
  int number = 0;
  ScrollController controller = ScrollController();
  List<Widget> widgets = [];
  List<String> lackmbti=[];

  @override
  void initState() {
    widgets = [];
    widgets.add(AiMessage(message: question[number]));
    number++;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("재빌드");
    return Basic(
        widgets: Stack(children: [
          Column(
              children: [Top(), Flexible(child: ChatList(widgets: widgets))]),
          InputText(
            setst: setst,
          )
        ]),
        paddings: 0);
  }

  setst() async {
    String text=Textcontroller.text;

    if (number == 12) { //모든종합 질문이 끝났을 때,
      String mbtis = await AnswerCommon(text);
      for(int i=0;i<4;i++)
        mbti[mbtis[i]]=mbti[mbtis[i]]!+1;
      setState(() {
        widgets.add(MyMessage(message:text));
        //마지막체크 (다 나왔다면 바로 결과, 아니면 추가 질문 생성)
        lackmbti = mbticheck();
        if (lackmbti.length == 0) showResult();
        else {
          limitnumber += (lackmbti.length * 2);
          if (lackmbti.contains('IE')) lackQuestion.add(question_IE);
          if (lackmbti.contains('SN')) lackQuestion.add(question_SN);
          if (lackmbti.contains('TF')) lackQuestion.add(question_TF);
          if (lackmbti.contains('PJ')) lackQuestion.add(question_PJ);
        }
        number++;
      });
    }
    else if(number<12){ //종합질문중
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
    else if(number>12 && number<limitnumber){ //추가질문중
      String mbtis = await AnswerMbti(text,lackmbti[((number-13)/2).toInt()]);
      for(int i=0;i<2;i++)
        mbti[mbtis[i]]=mbti[mbtis[i]]!+1;
      setState(() {
        widgets.add(MyMessage(message: text));
        AnswerCommon(text);
        sumAnswer = sumAnswer + text;
        widgets.add(AiMessage(message: lackQuestion[((number-13)/2).toInt()][number%2]));
        number++;
      });
    }
    else{ //추가질문까지 모두 완료
      String mbtis = await AnswerMbti(text,lackmbti[((number-13)/2).toInt()]);
      for(int i=0;i<2;i++)
        mbti[mbtis[i]]=mbti[mbtis[i]]!+1;
      showResult();
    }
  }

  List<String> mbticheck() {
    List<String> list = [];
    if (mbti['I'] == mbti['E']) list.add('IE');
    if (mbti['S'] == mbti['N']) list.add('SN');
    if (mbti['T'] == mbti['F']) list.add('TF');
    if (mbti['P'] == mbti['J']) list.add('PJ');
    return list;
  }

  showResult(){
    setState(() {
      sumAnswer = sumAnswer + Textcontroller.text;
      AnswerCommon(sumAnswer);
      widgets.add(mbticheck().length > 1
          ? GoResultButton(
        //다시하기
          message: "당신은 예상할 수 없는 사람이네요! \n저랑 다시 대화해주세요🥹",
          onPressed: () =>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(check: false)),(route)=>false),
          buttonText: "다시 하기")
          : GoResultButton(
        //결과보기
          message: "당신이 어떤 사람인지 알겠어요!😉",
          onPressed: ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ResultScreen(mbti: mbti,content: sumAnswer,)),(route)=>false),
          buttonText: "결과 보기"));
    });
  }
}
