import 'package:app_kidska/models/alphabet.dart';
import 'package:app_kidska/shared/components/cloud_sun.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import '../../shared/components/app_bar.dart';
import '../../shared/images.dart';
import 'components/button_letter.dart';

class AlphabetView extends StatelessWidget {
  const AlphabetView({super.key});

  void goToView(BuildContext context, Alphabet alphabet) {
    context.push('${AppRoutes.alphabetDetail}/${alphabet.description}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        label: 'Alfabeto',
      ),
      body: Stack(
        children: [
          const CloudSun(
            top: 0,
            right: 0,
            height: 100,
            icon: AppImages.sun,
          ),
          const CloudSun(
            bottom: 0,
            right: 0,
            height: 70,
            icon: AppImages.cloudThree,
          ),
          const CloudSun(
            top: 100,
            left: -20,
            height: 140,
            icon: AppImages.cloudTwo,
          ),
          const CloudSun(
            bottom: 100,
            left: 0,
            height: 100,
          ),
          GridView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 60,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.1,
            ),
            children: [
              for (var letter in Alphabet.values)
                ButtonLetter(
                  alphabet: letter,
                  onTap: () => goToView(context, letter),
                )
            ],
          )
        ],
      ),
    );
  }
}
