import 'package:app_kidska/models/animals.dart';
import 'package:app_kidska/shared/components/app_bar.dart';
import 'package:app_kidska/views/animals/components/button_animal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class AnimalsView extends StatelessWidget {
  const AnimalsView({super.key});

  void goToView(BuildContext context, Animals animals) {
    context.push('${AppRoutes.animalDetail}/${animals.description}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(label: 'Animais'),
      body: GridView(
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
                animals: animal, onTap: () => goToView(context, animal))
        ],
      ),
    );
  }
}
