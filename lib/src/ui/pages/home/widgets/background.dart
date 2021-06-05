import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({Key? key}) : super(key: key);

  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.center,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8],
      colors: [Color(0xff2e305f), Color(0xff202333)],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Purple container
        Container(decoration: boxDecoration),
        //Green box
        Positioned(
          top: -100,
          left: -60,
          child: _GreenBox(),
        )
      ],
    );
  }
}

class _GreenBox extends StatelessWidget {
  const _GreenBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
            colors: [Color(0xff4adf7d), Color(0xff2b7842)],
          ),
        ),
      ),
    );
  }
}
