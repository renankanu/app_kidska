import 'package:app_kidska/app/data/models/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/images.dart';

class ButtonNumber extends StatelessWidget {
  const ButtonNumber({
    super.key,
    required this.number,
    required this.onTap,
  });

  final Numbers number;
  final VoidCallback onTap;

  String get iconByName {
    switch (number) {
      case Numbers.zero:
        return AppImages.zero;
      case Numbers.one:
        return AppImages.one;
      case Numbers.two:
        return AppImages.two;
      case Numbers.three:
        return AppImages.three;
      case Numbers.four:
        return AppImages.four;
      case Numbers.five:
        return AppImages.five;
      case Numbers.six:
        return AppImages.six;
      case Numbers.seven:
        return AppImages.seven;
      case Numbers.eight:
        return AppImages.eight;
      case Numbers.nine:
        return AppImages.nine;
      default:
        return AppImages.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: number.value,
        child: SvgPicture.asset(
          iconByName,
        ),
      ),
    );
  }
}
