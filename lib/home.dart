import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/app_bar_avatar.dart';
import 'package:moniepoint_test/widget/app_bar_location.dart';
import 'package:moniepoint_test/widget/bottom_nav_bar.dart';
import 'package:moniepoint_test/widget/grid_card.dart';
import 'package:moniepoint_test/widget/offers_sticker.dart';
import 'package:moniepoint_test/widget/regular_text.dart';
import 'package:moniepoint_test/widget/text_veil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> _textOneAnimation;
  late AnimationController _textOneAnimationController;

  late Animation<double> _textTwoFadeAnimation;
  late AnimationController _textTwoFadeAnimationController;

  late Animation<Offset> _textTwoSlideAnimation;
  late AnimationController _textTwoSlideAnimationController;

  late Animation<double> _textThreeFadeAnimation;
  late AnimationController _textThreeFadeAnimationController;

  late Animation<Offset> _textThreeSlideAnimation;
  late AnimationController _textThreeSlideAnimationController;

  late Animation<Offset> _gridSlideAnimation;
  late AnimationController _gridSlideAnimationController;

  late Animation<Offset> _bottomNavBarSlideAnimation;
  late AnimationController _bottomNavBarSlideAnimationController;

  bool isTextTwoComplete = true;
  bool isTextThreeComplete = true;

  @override
  void initState() {
    super.initState();

    _textOneTransition();

    _textTwoTransition();

    _textThreeTransition();

    _gridTransition();

    _bottomNavBarTransition();
  }

  void _bottomNavBarTransition() {
    _bottomNavBarSlideAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _bottomNavBarSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(_bottomNavBarSlideAnimationController);

    Timer(const Duration(milliseconds: 6000), () {
      _bottomNavBarSlideAnimationController.forward();
    });
  }

  void _gridTransition() {
    _gridSlideAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _gridSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 1.5), end: Offset.zero)
            .animate(_gridSlideAnimationController);

    Timer(const Duration(milliseconds: 4000), () {
      _gridSlideAnimationController.forward();
    });
  }

  void _textThreeTransition() {
    _textThreeFadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _textThreeSlideAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        if (_textThreeSlideAnimationController.isCompleted) {
          setState(() {
            isTextThreeComplete = false;
          });
        }
      });

    _textThreeSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.7), end: Offset.zero)
            .animate(_textThreeFadeAnimationController);
    _textThreeFadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(_textThreeFadeAnimationController);

    _textThreeSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.7), end: Offset.zero)
            .animate(_textThreeFadeAnimationController);
    _textThreeFadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(_textThreeFadeAnimationController);

    Timer(const Duration(milliseconds: 2800), () {
      _textThreeFadeAnimationController.forward();
      _textThreeSlideAnimationController.forward();
    });
  }

  void _textTwoTransition() {
    _textTwoFadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _textTwoSlideAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        if (_textTwoSlideAnimationController.isCompleted) {
          setState(() {
            isTextTwoComplete = false;
          });
        }
      });

    _textTwoSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.7), end: Offset.zero)
            .animate(_textTwoFadeAnimationController);
    _textTwoFadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(_textTwoFadeAnimationController);
  }

  void _textOneTransition() {
    _textOneAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        if (_textOneAnimationController.isCompleted) {
          _textTwoFadeAnimationController.forward();
          _textTwoSlideAnimationController.forward();
        }
      });

    _textOneAnimation =
        Tween<double>(begin: 0, end: 1).animate(_textOneAnimationController);

    Timer(const Duration(milliseconds: 2000), () {
      _textOneAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                    0.3,
                    0.8
                  ],
                      colors: [
                    Colors.white,
                    Color.fromRGBO(247, 224, 195, 1.0),
                  ])),
              child: NestedScrollView(
                  headerSliverBuilder: (context, value) => [
                        SliverToBoxAdapter(
                          child: SafeArea(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppBarLocation(name: "Saint Petersburg"),
                                      AppBarAvatar(
                                          image:
                                              'asset/image/app_bar_avatar.png')
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  FadeTransition(
                                    opacity: _textOneAnimation,
                                    child: const MoniePointText(
                                        fontSize: 30,
                                        wordSpacing: -1,
                                        letterSpacing: -0.3,
                                        content: 'Hi, Marina',
                                        color: TestColors.textColor2),
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SlideTransition(
                                          position: _textTwoSlideAnimation,
                                          child: FadeTransition(
                                            opacity: _textTwoFadeAnimation,
                                            child: const MoniePointText(
                                                fontSize: 55,
                                                lineSpacing: 1,
                                                wordSpacing: -1,
                                                letterSpacing: -0.3,
                                                content: 'let\'s select your',
                                                color: TestColors.textColor3),
                                          ),
                                        ),
                                        Visibility(
                                            visible: isTextTwoComplete,
                                            child: const TextVeil()),
                                        SlideTransition(
                                          position: _textThreeSlideAnimation,
                                          child: FadeTransition(
                                            opacity: _textThreeFadeAnimation,
                                            child: const MoniePointText(
                                                fontSize: 55,
                                                lineSpacing: 1,
                                                wordSpacing: -1,
                                                letterSpacing: -0.3,
                                                content: 'perfect place',
                                                color: TestColors.textColor3),
                                          ),
                                        ),
                                        Visibility(
                                            visible: isTextThreeComplete,
                                            child: const TextVeil()),
                                      ]),
                                  const SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      OfferSticker(
                                          stickerType: 'BUY',
                                          stickerAmount: '1 034',
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2) -
                                              30,
                                          boxShape: BoxShape.circle,
                                          boxColor: TestColors.primaryColor,
                                          fontColor: TestColors.white),
                                      OfferSticker(
                                          stickerType: 'RENT',
                                          stickerAmount: '2 212',
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2) -
                                              30,
                                          boxColor: TestColors.white,
                                          fontColor: TestColors.textColor2)
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                  body: SlideTransition(
                    position: _gridSlideAnimation,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 8,
                        children: [
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1,
                              child: GridCard(
                                  asset: 'asset/image/home1.png',
                                  width: MediaQuery.of(context).size.width - 30,
                                  delay: 3800,
                                  content: "Gladkova St.,25")),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 2,
                              child: GridCard(
                                  asset: 'asset/image/home2.png',
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          30,
                                  delay: 4200,
                                  content: "Gubina St.,11")),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: GridCard(
                                asset: 'asset/image/home3.png',
                                width: (MediaQuery.of(context).size.width / 2) -
                                    30,
                                delay: 4000,
                                content: "Trefoleva St., 43",
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: GridCard(
                                  asset: 'asset/image/home4.png',
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          30,
                                  delay: 4200,
                                  content: "Sedova St.,22")),
                        ],
                      ),
                    ),
                  )),
            ),
            SlideTransition(
                position: _bottomNavBarSlideAnimation,
                child: const MoniePointBottomNavBar(
                  isLocationSelected: false,
                  isMessageSelected: false,
                  isHomeSelected: true,
                  isLikeSelected: false,
                  isProfileSelected: false,
                ))
          ],
        )),
      ),
    );
  }
}
