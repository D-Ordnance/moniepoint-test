import 'package:flutter/material.dart';
import 'package:moniepoint_test/map.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/bottom_nav_item.dart';

class MoniePointBottomNavBar extends StatelessWidget {
  final bool isLocationSelected;
  final bool isMessageSelected;
  final bool isHomeSelected;
  final bool isLikeSelected;
  final bool isProfileSelected;
  const MoniePointBottomNavBar(
      {super.key,
      required this.isLocationSelected,
      required this.isMessageSelected,
      required this.isHomeSelected,
      required this.isLikeSelected,
      required this.isProfileSelected});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: const BoxDecoration(
            color: TestColors.textColor3,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MoniePointBottomNavItem(
              image: 'asset/image/map.svg',
              isSelected: isLocationSelected,
              onTap: () => _selectedLocation(context),
            ),
            _spacing(),
            MoniePointBottomNavItem(
              image: 'asset/image/messages.svg',
              isSelected: isMessageSelected,
              onTap: () => _selectedMessage(),
            ),
            _spacing(),
            MoniePointBottomNavItem(
              image: 'asset/image/home.svg',
              isSelected: isHomeSelected,
              onTap: () => _selectedHome(context),
            ),
            _spacing(),
            MoniePointBottomNavItem(
              image: 'asset/image/likes.svg',
              isSelected: isLikeSelected,
              onTap: () => _selectedLike(),
            ),
            _spacing(),
            MoniePointBottomNavItem(
              image: 'asset/image/profile.svg',
              isSelected: isProfileSelected,
              onTap: () => _selectedProfile(),
            ),
          ],
        ),
      ),
    );
  }

  _spacing() => const SizedBox(width: 8);

  _selectedLocation(BuildContext context) {
    if (!isLocationSelected) {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
        return const MoniePointMap();
      }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      }));
    }
  }

  _selectedMessage() {}

  _selectedHome(BuildContext context) {
    if (!isHomeSelected) {
      Navigator.of(context).pop();
    }
  }

  _selectedLike() {}

  _selectedProfile() {}
}
