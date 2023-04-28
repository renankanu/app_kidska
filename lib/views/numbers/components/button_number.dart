import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonNumber extends StatelessWidget {
  const ButtonNumber({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 80,
              width: 80,
            ),
          ],
        ),
      ),
    );
  }
}
