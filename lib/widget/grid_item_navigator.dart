import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/regular_text.dart';

class GridItemNavigator extends StatefulWidget {
  final double width;
  final int delay;
  final String content;
  const GridItemNavigator(
      {super.key,
      required this.width,
      required this.delay,
      required this.content});

  @override
  State<GridItemNavigator> createState() => _GridItemNavigatorState();
}

class _GridItemNavigatorState extends State<GridItemNavigator>
    with TickerProviderStateMixin {
  late Animation<double> _scaleAnimation;
  late AnimationController _scaleAnimationController;

  late Animation<double> _sizeAnimation;
  late AnimationController _sizeAnimationController;

  animationListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _sizeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _scaleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() {
        if (_scaleAnimationController.isCompleted) {
          _sizeAnimationController.forward();
        }
      });

    _sizeAnimation = CurvedAnimation(
      parent: _sizeAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    Timer(Duration(milliseconds: widget.delay), () {
      _scaleAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _sizeAnimation,
      axis: Axis.horizontal,
      child: Container(
          height: 50,
          // alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(201, 189, 177, 1).withOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          width: widget.width,
          child: Row(
            children: [
              Expanded(
                child: MoniePointText(
                    fontSize: 25,
                    content: widget.content,
                    textAlign: TextAlign.center,
                    letterSpacing: -0.3,
                    wordSpacing: -1,
                    maxLine: 1,
                    fontWeight: FontWeight.w600,
                    color: TestColors.boxColor1),
              ),
              ScaleTransition(
                scale: _scaleAnimation,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: TestColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: TestColors.boxColor1.withOpacity(0.3),
                                offset: const Offset(-2, 0),
                                blurRadius: 20,
                                spreadRadius: 3)
                          ]),
                      child: Icon(
                        Icons.chevron_right,
                        size: 14,
                        color: const Color.fromRGBO(201, 189, 177, 1)
                            .withOpacity(0.9),
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
