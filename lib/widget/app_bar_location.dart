import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/widget/regular_text.dart';

class AppBarLocation extends StatefulWidget {
  final String name;
  const AppBarLocation({super.key, required this.name});

  @override
  State<AppBarLocation> createState() => _AppBarLocationState();
}

class _AppBarLocationState extends State<AppBarLocation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _fadeInAnimation;
  late AnimationController _fadeInAnimationController;

  @override
  void initState() {
    super.initState();
    _fadeInAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _fadeInAnimation =
        Tween<double>(begin: 0, end: 1).animate(_fadeInAnimationController);

    Timer(const Duration(milliseconds: 980), () {
      _fadeInAnimationController.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _fadeInAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 185.0),
        duration: const Duration(milliseconds: 1000),
        builder: (context, size, child) {
          return Container(
            width: size,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(250, 247, 247, 1.0),
                      offset: Offset(1, 2),
                      spreadRadius: 2.0,
                      blurRadius: 10.0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: FadeTransition(
              opacity: _fadeInAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('asset/image/location.svg',
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                          Color.fromRGBO(180, 165, 135, 1), BlendMode.srcIn)),
                  const SizedBox(width: 5),
                  MoniePointText(
                      fontSize: 20,
                      wordSpacing: -1,
                      letterSpacing: -0.3,
                      content: widget.name,
                      color: const Color.fromRGBO(180, 165, 135, 1))
                ],
              ),
            ),
          );
        });
  }
}
