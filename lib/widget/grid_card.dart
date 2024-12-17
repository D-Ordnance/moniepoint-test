import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moniepoint_test/widget/grid_item_navigator.dart';

class GridCard extends StatelessWidget {
  final String asset;
  final double width;
  final int delay;
  final String content;
  const GridCard(
      {super.key,
      required this.asset,
      required this.width,
      required this.delay,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
        Radius.circular(20),
      )),
      child: Stack(
        children: [
          Image.asset(asset,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
          Positioned(
              bottom: 10,
              left: 10,
              child: GridItemNavigator(
                width: width,
                delay: delay,
                content: content,
              ))
        ],
      ),
    );
  }
}
