import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final List<Widget> widgets;

  const ChatList({
    required this.widgets,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        //shrinkWrap: true,
        child: Column(children: widgets)
    );
  }
}
