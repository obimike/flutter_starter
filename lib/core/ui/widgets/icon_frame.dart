import 'package:flutter/material.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/core/util/helpers/functions.dart';

class IconFrame extends StatelessWidget {
  const IconFrame(
      {super.key,
      this.color,
      this.backgroundColor,
      required this.icon,
      this.size});

  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor, // Set the background color
        borderRadius: BorderRadius.circular(40), // Optional: Set border radius
      ),
      child: Icon(
        icon,
        size: size,
        color: color ??
            (MyFunctions.isDark(context)
                ? MyColors.white
                : MyColors.primaryTextColorLight),
      ),
    );
  }
}
