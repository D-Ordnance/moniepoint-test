import 'package:flutter/material.dart';

enum AnimationType { empty, fade, curtain }

class MoniePointText extends StatefulWidget {
  final String content;
  final double fontSize;
  final FontWeight fontWeight;
  final double lineSpacing;
  final double wordSpacing;
  final double letterSpacing;
  final TextAlign textAlign;
  final Color color;
  final AnimationType animationType;
  final double? delayInMilliSeconds;
  final double? duration;
  final TextOverflow overflow;
  final int? maxLine;
  const MoniePointText(
      {super.key,
      required this.fontSize,
      required this.content,
      this.fontWeight = FontWeight.w400,
      this.lineSpacing = 1.5,
      this.wordSpacing = 1,
      this.letterSpacing = 1,
      this.overflow = TextOverflow.fade,
      this.textAlign = TextAlign.start,
      this.maxLine,
      required this.color,
      this.animationType = AnimationType.fade,
      this.delayInMilliSeconds,
      this.duration});

  @override
  State<MoniePointText> createState() => _MoniePointTextState();
}

class _MoniePointTextState extends State<MoniePointText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.content,
        textAlign: widget.textAlign,
        maxLines: widget.maxLine,
        style: TextStyle(
            color: widget.color,
            height: widget.lineSpacing,
            wordSpacing: widget.wordSpacing,
            letterSpacing: widget.letterSpacing,
            overflow: widget.overflow,
            fontFamily: 'LeagueSpartan',
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize),
        textDirection: TextDirection.ltr);
  }
}
