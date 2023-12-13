import 'package:flutter/material.dart';
import 'package:flutter_starter/core/util/constants/image_string.dart';

class RoundImage extends StatelessWidget {
  const RoundImage({super.key, this.image, this.size = 36});

  final String? image;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: image == null
          ? Image.asset(
              MyImages.mary,
              width: size,
              height: size,
              fit: BoxFit.cover,
            )
          : Image.network(
              image!, // Replace with your image URL
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
    );
  }
}
