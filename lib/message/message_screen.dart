import 'package:ai_me/common/basic.dart';
import 'package:ai_me/common/qustion_list.dart';
import 'package:ai_me/message/component/ai_message.dart';
import 'package:ai_me/message/component/chat_list.dart';
import 'package:ai_me/message/component/input_text.dart';
import 'package:ai_me/message/component/top.dart';
import 'package:flutter/material.dart';

import 'component/go_result_button.dart';
import 'component/my_message.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int number=0;
  ScrollController controller = ScrollController();
  List<Widget> widgets = [];
  @override
  void initState() {

    widgets=[];
    widgets.add(AiMessage(message: question[number]));
    number++;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("재빌드");
    return Basic(
        widgets: Stack(children: [
          Column(children: [
            Top(),
            Flexible(
                child:ChatList(widgets: widgets)
            )]),
          InputText(setst: setst,)
        ]),
        paddings: 0);
  }
  setst() {
    if(number==12){
      setState(() {
        widgets.add(MyMessage(message: Textcontroller.text));
        widgets.add(
            number==12?
        GoResultButton(    //다시하기
            message:  "당신은 예상할 수 없는 사람이네요! \n저랑 다시 대화해주세요🥹",
            onPressed: (){},
            buttonText: "다시 하기"):
        GoResultButton( //결과보기
            message:  "당신이 어떤 사람인지 알겠어요!😉",
            onPressed: (){},
            buttonText: "결과 보기")
        );
      });
    }
    else {
      setState(() {
        widgets.add(MyMessage(message: Textcontroller.text));
        widgets.add(AiMessage(message: question[number]));
        number++;
      });
    }
  }
}