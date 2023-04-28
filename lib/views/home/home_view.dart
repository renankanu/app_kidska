import 'package:app_kidska/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/images.dart';
import 'components/home_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCard(
                  icon: AppImages.icNumbers,
                  label: 'Números',
                  onTap: () => context.go(AppRoutes.numbers),
                ),
                HomeCard(
                  icon: AppImages.icLetters,
                  label: 'Letras',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCard(
                  icon: AppImages.icDog,
                  label: 'Animais',
                  height: 60,
                  width: 60,
                  onTap: () {},
                ),
                HomeCard(
                  icon: AppImages.icColors,
                  label: 'Cores',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
