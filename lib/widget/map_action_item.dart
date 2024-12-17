import 'package:flutter/material.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/bottom_nav_item.dart';
import 'package:moniepoint_test/widget/regular_text.dart';

class MoreActionItem extends StatelessWidget {
  final String content;
  final String asset;
  final bool isSelected;
  final OnTap onTap;

  const MoreActionItem(
      {super.key,
      required this.content,
      required this.asset,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            height: 18,
            width: 18,
            colorBlendMode: BlendMode.srcIn,
            color: isSelected ? TestColors.primaryColor : TestColors.disabled,
          ),
          const SizedBox(width: 10),
          MoniePointText(
              fontSize: 14,
              content: content,
              textAlign: TextAlign.start,
              lineSpacing: 1,
              letterSpacing: -0.3,
              color: isSelected ? TestColors.primaryColor : TestColors.disabled)
        ],
      ),
    );
  }
}
