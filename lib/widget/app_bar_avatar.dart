import 'package:flutter/material.dart';

class AppBarAvatar extends StatelessWidget {
  final String image;
  const AppBarAvatar({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 40),
        duration: const Duration(milliseconds: 1000),
        builder: (context, size, child) {
          return AnimatedAlign(
            alignment: Alignment.bottomCenter,
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              height: size,
              width: size,
              image,
            ),
          );
        });
  }
}
