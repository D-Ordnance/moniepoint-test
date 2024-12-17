import 'package:flutter/material.dart';
import 'package:moniepoint_test/widget/regular_text.dart';

class StickerAmountCounter extends ImplicitlyAnimatedWidget {
  final int amount;
  final Color fontColor;
  const StickerAmountCounter(
      {super.key,
      required this.amount,
      required super.duration,
      required this.fontColor});

  @override
  ImplicitlyAnimatedWidgetState<StickerAmountCounter> createState() =>
      _StickerAmountCounterState();
}

class _StickerAmountCounterState
    extends AnimatedWidgetBaseState<StickerAmountCounter> {
  late IntTween _counter;

  @override
  void initState() {
    _counter = IntTween(begin: widget.amount, end: widget.amount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MoniePointText(
        fontSize: 60,
        fontWeight: FontWeight.w600,
        wordSpacing: -1,
        letterSpacing: -0.3,
        lineSpacing: 1,
        textAlign: TextAlign.center,
        content: '${_counter.evaluate(animation)}',
        color: widget.fontColor);
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _counter = visitor(
            _counter, widget.amount, (dynamic value) => IntTween(begin: value))
        as IntTween;
  }
}
