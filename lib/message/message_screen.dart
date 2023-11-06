import 'package:ai_me/common/basic.dart';
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

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Basic(
        widgets: Stack(children: [
          Column(children: [
            Top(),
            SizedBox(height: 10.h),
            Flexible(
                child: ListView(
              physics: ClampingScrollPhysics(),
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                AiMessage(),  //ai메세지카드
                MyMessage(),//내메세지카드
              ],
            ))]),
          InputText()
        ]),
        paddings: 0);
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