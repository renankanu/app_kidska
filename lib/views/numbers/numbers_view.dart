import 'package:app_kidska/shared/components/app_bar.dart';
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
    );
  }
}
