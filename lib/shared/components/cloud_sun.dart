import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../images.dart';

class CloudSun extends StatelessWidget {
  const CloudSun({
    super.key,
    this.bottom,
    this.right,
    this.left,
    this.top,
    this.height = 90,
    this.icon = AppImages.cloudOne,
    this.color,
  });

  final double? bottom;
  final double? right;
  final double? left;
  final double? top;
  final double height;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      left: left,
      top: top,
      child: SvgPicture.asset(
        icon,
        height: height,
        fit: BoxFit.cover,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}
