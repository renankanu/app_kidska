import 'package:app_kidska/app/data/models/animals.dart';
import 'package:app_kidska/app/shared/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../routes/app_pages.dart';
import '../../shared/components/cloud_sun.dart';
import '../../shared/images.dart';
import 'components/button_animal.dart';

class AnimalsView extends StatelessWidget {
  const AnimalsView({super.key});

  void goToView(Animals animals) {
    Get.toNamed(Routes.animalsDetail, arguments: animals);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const BaseAppBar(label: 'Animais'),
      body: Stack(
        children: [
          const CloudSun(
            top: 0,
            left: 6,
            height: 80,
            icon: AppImages.sun,
          ),
          CloudSun(
            top: height * 0.2,
            right: -20,
            height: 70,
            icon: AppImages.cloudThree,
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
              for (var animal in Animals.values)
                ButtonAnimal(
                  animals: animal,
                  onTap: () => goToView(animal),
                )
            ],
          ),
        ],
      ),
    );
  }
}
