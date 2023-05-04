import 'package:app_kidska/shared/components/cloud_sun.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import '../../shared/images.dart';
import 'components/home_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          const CloudSun(
            top: 0,
            left: 0,
            height: 80,
            icon: AppImages.cloud00,
          ),
          const CloudSun(
            top: 20,
            right: 0,
            height: 50,
            icon: AppImages.cloud01,
          ),
          CloudSun(
            top: 60,
            right: width / 2,
            height: 60,
            icon: AppImages.cloud02,
          ),
          CloudSun(
            top: 0,
            left: width / 2,
            height: 60,
            icon: AppImages.cloud02,
          ),
          Positioned(
            top: height * 0.06,
            right: 0,
            left: 0,
            child: Image.asset(
              AppImages.appIcon,
              height: 20,
              color: Colors.black,
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeCard(
                        icon: AppImages.icNumbers,
                        label: 'Números',
                        onTap: () => context.push(AppRoutes.numbers),
                      ),
                      HomeCard(
                        icon: AppImages.icLetters,
                        label: 'Letras',
                        onTap: () => context.push(AppRoutes.alphabet),
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
                        onTap: () => context.push(AppRoutes.animals),
                      ),
                      HomeCard(
                        icon: AppImages.icColors,
                        label: 'Cores',
                        onTap: () => context.push(AppRoutes.colors),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
