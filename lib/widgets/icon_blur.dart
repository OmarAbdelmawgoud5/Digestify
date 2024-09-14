import 'dart:ui';

import 'package:flutter/material.dart';

class IconBlur extends StatelessWidget {
  const IconBlur({
    super.key,
    required this.icon,
    required this.paddingFromLeft,
    required this.onpressed,
  });
  final IconData icon;
  final double paddingFromLeft;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Container(
          padding: EdgeInsets.only(left: paddingFromLeft),
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onpressed,
            icon: Icon(
              size: 24,
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
