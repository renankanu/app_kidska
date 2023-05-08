import 'package:app_kidska/app/data/models/animals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/images.dart';

class ButtonAnimal extends StatelessWidget {
  const ButtonAnimal({
    super.key,
    required this.animals,
    required this.onTap,
  });
  final Animals animals;
  final VoidCallback onTap;

  String get iconByName {
    switch (animals) {
      case Animals.dog:
        return AppImages.dog;
      case Animals.cat:
        return AppImages.cat;
      case Animals.cow:
        return AppImages.cow;
      case Animals.duck:
        return AppImages.duck;
      case Animals.elephant:
        return AppImages.elephant;
      case Animals.horse:
        return AppImages.horse;
      case Animals.lion:
        return AppImages.lion;
      case Animals.chicken:
        return AppImages.chicken;
      default:
        return AppImages.dog;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: animals,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: SvgPicture.asset(
            iconByName,
          ),
        ),
      ),
    );
  }
}
