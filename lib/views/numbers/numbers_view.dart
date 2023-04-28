import 'package:app_kidska/shared/components/app_bar.dart';
import 'package:app_kidska/shared/images.dart';
import 'package:app_kidska/views/numbers/components/button_number.dart';
import 'package:flutter/material.dart';

class NumbersView extends StatelessWidget {
  const NumbersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                ButtonNumber(
                  icon: AppImages.numbersZero,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersOne,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersTwo,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersThree,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersFour,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersFive,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersSix,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersSeven,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersEight,
                  onTap: () {},
                ),
                ButtonNumber(
                  icon: AppImages.numbersNine,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
