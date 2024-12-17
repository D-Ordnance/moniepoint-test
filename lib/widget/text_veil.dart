import 'package:flutter/material.dart';

class TextVeil extends StatelessWidget {
  const TextVeil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(stops: [
          1,
          0.1
        ], colors: [
          Colors.white,
          Color.fromRGBO(248, 242, 233, 1),
        ])));
  }
}
