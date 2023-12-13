import 'package:flutter/material.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/core/util/helpers/functions.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    this.onPress,
    this.size = 16,
    this.color,
    required this.icon, this.backgroundColor,
  });

  final Function(void)? onPress;
  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final IconData icon;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,// Set the background color
        borderRadius: BorderRadius.circular(20), // Optional: Set border radius
      ),
      child: IconButton(
        onPressed: ()=>onPress,
        icon: Icon(
          icon,
          size: size,
          color: color ?? (MyFunctions.isDark(context)?  MyColors.white: MyColors.primaryTextColorLight),
        ),
      ),
    );
  }
}
