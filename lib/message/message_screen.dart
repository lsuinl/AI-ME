import 'package:ai_me/common/basic.dart';
import 'package:ai_me/common/qustion_list.dart';
import 'package:ai_me/message/component/ai_message.dart';
import 'package:ai_me/message/component/go_result_button.dart';
import 'package:ai_me/message/component/input_text.dart';
import 'package:ai_me/message/component/my_message.dart';
import 'package:ai_me/message/component/top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}
List<Widget> widgets = [];
class _MessageScreenState extends State<MessageScreen> {
  int number=0;
  List<Widget> widgetlist=[];
  ScrollController controller = ScrollController();

  @override
  void initState() {
    widgets=[];
    widgets.add(AiMessage(message: question[number]));
    number++;
    widgetlist=widgets;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Basic(
        widgets: Stack(children: [
          Column(children: [
            Top(),
            Flexible(
                child: ListView(
                  controller: controller,
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shrinkWrap: true,
              children: widgetlist
            ))]),
          InputText(setst: setst,)
        ]),
        paddings: 0);
  }
  setst(){
    setState(() {
      widgets.add(
        AiMessage(message: question[number])
      );
      number++;
      widgetlist=widgets;
      print("??");
    });
  }
}

// GoResultButton(    //다시하기
// message:  "당신은 예상할 수 없는 사람이네요! \n저랑 다시 대화해주세요🥹",
// onPressed: (){},
// buttonText: "다시 하기"
// ),
// GoResultButton( //결과보기
// message:  "당신이 어떤 사람인지 알겠어요!😉",
// onPressed: (){},
// buttonText: "결과 보기"
// )