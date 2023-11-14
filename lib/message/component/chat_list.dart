import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends StatelessWidget {
  final List<Widget> widgets;

  const ChatList({required this.widgets, super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        controller: _scrollController,
        //shrinkWrap: true,
        child: Column(children: [
          Column(children: widgets),
          SizedBox(height: 120.h)
        ]));
  }
}
