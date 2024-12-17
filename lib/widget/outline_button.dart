import 'package:flutter/material.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/bottom_nav_item.dart';

class OutlinedButtonRippleEffect extends StatelessWidget {
  final Widget child;
  final OnTap onTap;
  const OutlinedButtonRippleEffect(
      {super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            splashColor: Colors.white,
            highlightColor: Colors.white,
            borderRadius: BorderRadius.circular(5),
            customBorder: CircleBorder(
                side: BorderSide(
                    color: TestColors.white.withOpacity(0.7),
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside)),
            child: child));
  }
}
