import 'package:flutter/material.dart';
import 'package:moniepoint_test/widget/bottom_nav_bar.dart';
import 'package:moniepoint_test/widget/map_action.dart';
import 'package:moniepoint_test/widget/more_map_actions.dart';
import 'package:moniepoint_test/widget/regular_textfield.dart';

class MoniePointMap extends StatefulWidget {
  const MoniePointMap({super.key});

  @override
  State<MoniePointMap> createState() => _MoniePointMapState();
}

class _MoniePointMapState extends State<MoniePointMap>
    with TickerProviderStateMixin {
  late bool isWallet;

  late Animation<double> _scaleAnimation;
  late AnimationController _scaleAnimationController;

  late Animation<double> _scaleMapPropertiesAnimation;
  late AnimationController _scaleMapPropertiesAnimationController;

  @override
  void initState() {
    isWallet = true;

    _scaleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _scaleAnimation = CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    _scaleMapPropertiesAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _scaleMapPropertiesAnimation = CurvedAnimation(
      parent: _scaleMapPropertiesAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    _scaleMapPropertiesAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 80,
              right: 20,
              child: RegularTextField(
                scaleAnimation: _scaleMapPropertiesAnimation,
              ),
            ),
            Positioned(
                left: 20,
                right: 20,
                bottom: 120,
                child: MapAction(
                    scaleAnimation: _scaleMapPropertiesAnimation,
                    onTap: () {
                      _scaleAnimationController.forward();
                    },
                    isWallet: isWallet)),
            Positioned(
                left: 20,
                bottom: 180,
                child: MoreMapAction(
                  scaleAnimationController: _scaleAnimationController,
                  scaleAnimation: _scaleAnimation,
                )),
            const MoniePointBottomNavBar(
              isLocationSelected: true,
              isMessageSelected: false,
              isHomeSelected: false,
              isLikeSelected: false,
              isProfileSelected: false,
            )
          ],
        ),
      ),
    );
  }
}
