import 'package:flutter/material.dart';
import 'package:moniepoint_test/theme/theme.dart';
import 'package:moniepoint_test/widget/map_action_item.dart';

class MoreMapAction extends StatefulWidget {
  final AnimationController scaleAnimationController;
  final Animation<double> scaleAnimation;
  const MoreMapAction(
      {super.key,
      required this.scaleAnimationController,
      required this.scaleAnimation});

  @override
  State<MoreMapAction> createState() => _MoreMapActionState();
}

class _MoreMapActionState extends State<MoreMapAction>
    with SingleTickerProviderStateMixin {
  late bool isCozyAreaSelected;
  late bool isWalletSelected;
  late bool isInsfractructureSelected;
  late bool isWithouLayerSelected;

  @override
  void initState() {
    isCozyAreaSelected = false;
    isWalletSelected = true;
    isInsfractructureSelected = false;
    isWithouLayerSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.bottomLeft,
      scale: widget.scaleAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: const BoxDecoration(
            color: TestColors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoreActionItem(
              content: "Cosy areas",
              asset: 'asset/image/cosy.png',
              isSelected: isCozyAreaSelected,
              onTap: _enabledCosy,
            ),
            const SizedBox(height: 18),
            MoreActionItem(
              content: "Price",
              asset: 'asset/image/small_wallet.png',
              isSelected: isWalletSelected,
              onTap: _enabledWalllet,
            ),
            const SizedBox(height: 18),
            MoreActionItem(
              content: "Infastructure",
              asset: 'asset/image/infastructure.png',
              isSelected: isInsfractructureSelected,
              onTap: _enabledInfastructure,
            ),
            const SizedBox(height: 18),
            MoreActionItem(
              content: "Without any layer",
              asset: 'asset/image/layer.png',
              isSelected: isWithouLayerSelected,
              onTap: _enabledWithoutLayer,
            )
          ],
        ),
      ),
    );
  }

  _enabledCosy() {
    widget.scaleAnimationController.reverse();
  }

  _enabledWalllet() {
    setState(() {
      isCozyAreaSelected = false;
      isWalletSelected = true;
      isInsfractructureSelected = false;
      isWithouLayerSelected = false;
    });

    widget.scaleAnimationController.reverse();
  }

  _enabledInfastructure() {
    widget.scaleAnimationController.reverse();
  }

  _enabledWithoutLayer() {
    setState(() {
      isCozyAreaSelected = false;
      isWalletSelected = false;
      isInsfractructureSelected = false;
      isWithouLayerSelected = true;
    });
    widget.scaleAnimationController.reverse();
  }
}