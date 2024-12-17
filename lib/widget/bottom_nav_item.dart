import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/outline_button.dart';

typedef OnTap = Function();

class MoniePointBottomNavItem extends StatelessWidget {
  final String image;
  final bool isSelected;
  final OnTap onTap;
  const MoniePointBottomNavItem(
      {super.key,
      required this.image,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonRippleEffect(
      onTap: onTap,
      // onTapUp: (details) => debugPrint("something up"),
      // onTapDown: (details) => debugPrint("something down"),
      child: Container(
        padding: EdgeInsets.all(isSelected ? 15 : 10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? TestColors.primaryColor : TestColors.boxColor1),
        child: SvgPicture.asset(image,
            colorFilter:
                const ColorFilter.mode(TestColors.white, BlendMode.srcIn)),
      ),
    );
  }
}
