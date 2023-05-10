import 'package:app_kidska/app/shared/components/app_bar.dart';
import 'package:app_kidska/app/shared/components/cloud_sun.dart';
import 'package:app_kidska/core_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/numbers.dart';
import '../../routes/app_pages.dart';
import '../../shared/images.dart';
import 'components/button_number.dart';

class NumbersView extends GetView<CoreController> {
  const NumbersView({super.key});

  void goToView(Numbers number) {
    controller.incrementTap();
    Get.toNamed(Routes.numbersDetail, arguments: number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        label: 'Números',
      ),
      body: Stack(
        children: [
          const CloudSun(
            top: 0,
            left: 0,
            height: 100,
            icon: AppImages.sun,
          ),
          const CloudSun(
            bottom: 0,
            right: 0,
            height: 100,
            icon: AppImages.cloudThree,
          ),
          const CloudSun(
            bottom: 200,
            right: 0,
            height: 60,
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
              for (var number in Numbers.values)
                ButtonNumber(
                  number: number,
                  onTap: () => goToView(number),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
