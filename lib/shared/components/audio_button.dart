import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart';

class AudioButton extends StatelessWidget {
  const AudioButton({
    super.key,
    required this.onTap,
    required this.isPlaying,
    this.buttonColor = AppColor.darkFern,
  });
  final VoidCallback onTap;
  final bool isPlaying;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: FaIcon(
            isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
