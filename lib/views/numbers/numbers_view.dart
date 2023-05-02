import 'package:app_kidska/shared/components/app_bar.dart';
import 'package:app_kidska/shared/components/cloud_sun.dart';
import 'package:app_kidska/views/numbers/components/button_number.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/numbers.dart';
import '../../routes/app_routes.dart';
import '../../shared/images.dart';

class NumbersView extends StatelessWidget {
  const NumbersView({super.key});

  void goToView(BuildContext context, Numbers number) {
    context.push('${AppRoutes.numberDetail}/${number.value}');
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
          Column(
            children: [
              Expanded(
                child: GridView(
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
                        onTap: () => goToView(context, number),
                      ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
