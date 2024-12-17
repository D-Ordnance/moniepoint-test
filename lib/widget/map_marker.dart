import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/regular_text.dart';

class MoniePointMapMaker extends StatefulWidget {
  final bool isWallet;
  final Animation<double> scaleAnimation;
  final Animation<double> sizeAnimation;
  const MoniePointMapMaker(
      {super.key,
      required this.isWallet,
      required this.scaleAnimation,
      required this.sizeAnimation});

  @override
  State<MoniePointMapMaker> createState() => _MoniePointMapMakerState();
}

class _MoniePointMapMakerState extends State<MoniePointMapMaker> {
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.bottomLeft,
      scale: widget.scaleAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(
            color: TestColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(0))),
        child: Stack(
          children: [
            Visibility(
                visible: !widget.isWallet,
                child: SvgPicture.asset('asset/image/building.svg')),
            Visibility(
              visible: widget.isWallet,
              child: const MoniePointText(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  content: '10,3mn P',
                  color: TestColors.white),
            )
          ],
        ),
      ),
    );
  }
}
