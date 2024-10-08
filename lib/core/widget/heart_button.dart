import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  final String id;
  final String? wishId;
  const HeartButton(
      {super.key, required this.onTap, required this.id, this.wishId});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // radius: 25,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () {
        setState(() {
          // isClicked = !isClicked;

          widget.onTap?.call();
        });
      },
      child: Material(
        // borderRadius: BorderRadius.circular(2),
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: ImageIcon(
              AssetImage(widget.id == widget.wishId
                  ? IconsAssets.icClickedHeart
                  : IconsAssets.icHeart),
              color: ColorManager.primary,
            )),
      ),
    );
  }
}
