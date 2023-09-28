import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget widgets;

  const Background({required this.widgets, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: widgets,
    ));
  }
}
