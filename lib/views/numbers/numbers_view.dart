import 'package:app_kidska/shared/components/app_bar.dart';
import 'package:app_kidska/shared/images.dart';
import 'package:app_kidska/views/numbers/components/button_number.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/numbers.dart';
import '../../routes/app_routes.dart';

class NumbersView extends StatelessWidget {
  const NumbersView({super.key});

  void goToView(BuildContext context, Numbers number) {
    context.push('${AppRoutes.numberDetail}/${number.value}');
  }

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
                  onTap: () => goToView(context, Numbers.zero),
                ),
                ButtonNumber(
                  icon: AppImages.numbersOne,
                  onTap: () => goToView(context, Numbers.one),
                ),
                ButtonNumber(
                  icon: AppImages.numbersTwo,
                  onTap: () => goToView(context, Numbers.two),
                ),
                ButtonNumber(
                  icon: AppImages.numbersThree,
                  onTap: () => goToView(context, Numbers.three),
                ),
                ButtonNumber(
                  icon: AppImages.numbersFour,
                  onTap: () => goToView(context, Numbers.four),
                ),
                ButtonNumber(
                  icon: AppImages.numbersFive,
                  onTap: () => goToView(context, Numbers.five),
                ),
                ButtonNumber(
                  icon: AppImages.numbersSix,
                  onTap: () => goToView(context, Numbers.six),
                ),
                ButtonNumber(
                  icon: AppImages.numbersSeven,
                  onTap: () => goToView(context, Numbers.seven),
                ),
                ButtonNumber(
                  icon: AppImages.numbersEight,
                  onTap: () => goToView(context, Numbers.eight),
                ),
                ButtonNumber(
                  icon: AppImages.numbersNine,
                  onTap: () => goToView(context, Numbers.nine),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
