import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moniepoint_test/widget/regular_text.dart';

class OfferSticker extends StatefulWidget {
  final BoxShape boxShape;
  final String stickerType;
  final String stickerAmount;
  final double width;
  final Color boxColor;
  final Color fontColor;
  const OfferSticker(
      {super.key,
      required this.stickerType,
      required this.stickerAmount,
      required this.width,
      this.boxShape = BoxShape.rectangle,
      required this.boxColor,
      required this.fontColor});

  @override
  State<OfferSticker> createState() => _OfferStickerState();
}

class _OfferStickerState extends State<OfferSticker>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    Timer(const Duration(milliseconds: 2500), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: widget.width,
        height: widget.width,
        decoration: BoxDecoration(
            color: widget.boxColor,
            shape: widget.boxShape,
            borderRadius: widget.boxShape != BoxShape.circle
                ? const BorderRadius.all(Radius.circular(20))
                : null),
        child: Column(
          children: [
            MoniePointText(
                fontSize: 20,
                wordSpacing: -1,
                letterSpacing: -0.3,
                content: widget.stickerType,
                color: widget.fontColor),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MoniePointText(
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                    wordSpacing: -1,
                    letterSpacing: -0.3,
                    lineSpacing: 1,
                    textAlign: TextAlign.center,
                    content: widget.stickerAmount,
                    color: widget.fontColor),
                MoniePointText(
                    fontSize: 20,
                    wordSpacing: -1,
                    letterSpacing: -0.3,
                    lineSpacing: 1,
                    textAlign: TextAlign.center,
                    content: 'offers',
                    color: widget.fontColor)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
