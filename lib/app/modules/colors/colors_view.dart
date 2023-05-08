import 'package:app_kidska/app/data/models/colors.dart';
import 'package:app_kidska/app/shared/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../routes/app_pages.dart';
import '../../shared/components/cloud_sun.dart';
import '../../shared/images.dart';

class ColorsView extends StatelessWidget {
  const ColorsView({super.key});

  void goToView(ModelColors color) {
    Get.toNamed(
      Routes.colorsDetail,
      arguments: color,
    );
  }

  Color _getColor(ModelColors color) {
    switch (color) {
      case ModelColors.red:
        return Colors.red;
      case ModelColors.blue:
        return Colors.blue;
      case ModelColors.green:
        return Colors.green;
      case ModelColors.yellow:
        return Colors.yellow;
      case ModelColors.pink:
        return const Color(0xFFFFCBDB);
      case ModelColors.black:
        return Colors.black;
      case ModelColors.brown:
        return const Color(0xFF964B00);
      case ModelColors.orange:
        return const Color(0xFFFFA500);
      default:
        return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        label: 'Cores',
      ),
      body: Stack(
        children: [
          const CloudSun(
            top: 0,
            left: -6,
            height: 400,
            icon: AppImages.bgColor,
            opacity: 0.2,
          ),
          const CloudSun(
            bottom: -10,
            right: -6,
            height: 100,
            icon: AppImages.bgColor,
            opacity: 0.2,
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
              for (var color in ModelColors.values)
                GestureDetector(
                  onTap: () => goToView(color),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        width: 4,
                        color: _getColor(color),
                      ),
                    ),
                    child: Center(
                      child: Hero(
                        tag: color.description,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: _getColor(color),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
