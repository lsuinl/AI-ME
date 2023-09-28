import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  final Widget widgets;
  final int paddings;

  const Basic({
    required this.widgets,
    required this.paddings,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAF9),
        body: SafeArea(
            top: true,
            bottom: true,
            child: Center(
                child: Padding(
                  padding: EdgeInsets.all(paddings.toDouble()),
                  child: widgets,
                ))
        ));
  }
}
