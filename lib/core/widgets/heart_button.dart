import 'package:elevate_flutter_task/core/resources/assets_manager.dart';
import 'package:elevate_flutter_task/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;

  const HeartButton({super.key, required this.onTap});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  String heartIcon = IconsAssets.heart;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () => setState(() {
        isClicked = !isClicked;
        heartIcon = !isClicked ? IconsAssets.heart : IconsAssets.clickedHeart;
        widget.onTap?.call();
      }),
      child: Material(
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(heartIcon),
        ),
      ),
    );
  }
}
