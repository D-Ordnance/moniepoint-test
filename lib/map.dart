import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moniepoint_test/widget/bottom_nav_bar.dart';
import 'package:moniepoint_test/widget/map_action.dart';
import 'package:moniepoint_test/widget/map_marker.dart';
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

  late Animation<double> _scaleMapMakerAnimation;
  late AnimationController _scaleMapMakerAnimationController;

  late Animation<double> _scaleMapPropertiesAnimation;
  late AnimationController _scaleMapPropertiesAnimationController;

  late Animation<double> _sizeMapMarkerAnimation;
  late AnimationController _sizeMapMakerAnimationController;

  @override
  void initState() {
    isWallet = true;

    _scaleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _scaleAnimation = CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    _scaleMapMakerAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _scaleMapMakerAnimation = CurvedAnimation(
      parent: _scaleMapMakerAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    _scaleMapPropertiesAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _scaleMapPropertiesAnimation = CurvedAnimation(
      parent: _scaleMapPropertiesAnimationController,
      curve: Curves.fastOutSlowIn,
    );

    _scaleMapPropertiesAnimationController.forward();

    Timer(const Duration(milliseconds: 1050), () {
      _scaleMapMakerAnimationController.forward();
    });

    _sizeMapMakerAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _sizeMapMarkerAnimation = CurvedAnimation(
      parent: _sizeMapMakerAnimationController,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    _scaleMapPropertiesAnimationController.dispose();
    _sizeMapMakerAnimationController.dispose();
    super.dispose();
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
            Positioned.fill(
                child: Image.asset(
              'asset/image/map.png',
              fit: BoxFit.cover,
            )),
            Positioned(
              left: 20,
              top: 80,
              right: 20,
              child: RegularTextField(
                scaleAnimation: _scaleMapPropertiesAnimation,
              ),
            ),
            Positioned(
                left: 100,
                top: 200,
                child: MoniePointMapMaker(
                  isWallet: isWallet,
                  scaleAnimation: _scaleMapMakerAnimation,
                  sizeAnimation: _sizeMapMarkerAnimation,
                )),
            Positioned(
                left: 250,
                top: 300,
                child: MoniePointMapMaker(
                  isWallet: isWallet,
                  scaleAnimation: _scaleMapMakerAnimation,
                  sizeAnimation: _sizeMapMarkerAnimation,
                )),
            Positioned(
                left: 60,
                top: 400,
                child: MoniePointMapMaker(
                  isWallet: isWallet,
                  scaleAnimation: _scaleMapMakerAnimation,
                  sizeAnimation: _sizeMapMarkerAnimation,
                )),
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
                  onTap: (p0) {
                    if (p0 == MarkerSelection.wallet) {
                      _scaleMapMakerAnimationController.reset();
                      _scaleMapMakerAnimationController.forward();
                      setState(() {
                        isWallet = true;
                      });
                    } else if (p0 == MarkerSelection.withoutLayout) {
                      _sizeMapMakerAnimationController.reset();
                      _sizeMapMakerAnimationController.forward();
                      setState(() {
                        isWallet = false;
                      });
                    }
                  },
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
