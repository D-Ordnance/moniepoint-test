import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/regular_text.dart';

class RegularTextField extends StatelessWidget {
  final Animation<double> scaleAnimation;
  const RegularTextField({super.key, required this.scaleAnimation});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                  color: TestColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  MoniePointText(
                      fontSize: 20,
                      content: "Saint Petersburg",
                      letterSpacing: -0.3,
                      color: TestColors.boxColor1),
                ],
              )),
        ),
      ),
      const SizedBox(width: 20),
      ScaleTransition(
        scale: scaleAnimation,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: const BoxDecoration(
                color: TestColors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: SvgPicture.asset(
              'asset/image/filter.svg',
              colorFilter:
                  const ColorFilter.mode(TestColors.boxColor1, BlendMode.srcIn),
            )),
      ),
    ]);
  }
}
