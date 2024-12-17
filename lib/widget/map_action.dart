import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/bottom_nav_item.dart';
import 'package:moniepoint_test/widget/regular_text.dart';

class MapAction extends StatefulWidget {
  final bool isWallet;
  final OnTap onTap;
  final Animation<double> scaleAnimation;
  const MapAction(
      {super.key,
      required this.onTap,
      this.isWallet = true,
      required this.scaleAnimation});

  @override
  State<MapAction> createState() => _MapActionState();
}

class _MapActionState extends State<MapAction> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            ScaleTransition(
              scale: widget.scaleAnimation,
              child: InkWell(
                onTap: widget.onTap,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: TestColors.boxColor1.withOpacity(0.8)),
                  child: SvgPicture.asset(
                    'asset/image/wallet.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ScaleTransition(
              scale: widget.scaleAnimation,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: TestColors.boxColor1.withOpacity(0.8)),
                child: SvgPicture.asset(
                  'asset/image/navigation2.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
        ScaleTransition(
          scale: widget.scaleAnimation,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                color: TestColors.boxColor1.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            child: Row(
              children: [
                SvgPicture.asset(
                  'asset/image/notes.svg',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 6),
                const MoniePointText(
                    fontSize: 15,
                    content: 'List of variants',
                    color: TestColors.white)
              ],
            ),
          ),
        )
      ],
    );
  }
}
