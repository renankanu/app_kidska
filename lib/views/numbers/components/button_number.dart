import 'package:app_kidska/models/numbers.dart';
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
        return AppImages.numbersZero;
      case Numbers.one:
        return AppImages.numbersOne;
      case Numbers.two:
        return AppImages.numbersTwo;
      case Numbers.three:
        return AppImages.numbersThree;
      case Numbers.four:
        return AppImages.numbersFour;
      case Numbers.five:
        return AppImages.numbersFive;
      case Numbers.six:
        return AppImages.numbersSix;
      case Numbers.seven:
        return AppImages.numbersSeven;
      case Numbers.eight:
        return AppImages.numbersEight;
      case Numbers.nine:
        return AppImages.numbersNine;
      default:
        return AppImages.numbersZero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Center(
          child: Hero(
            tag: number.value,
            child: SvgPicture.asset(
              iconByName,
              height: 80,
              width: 80,
            ),
          ),
        ),
      ),
    );
  }
}
