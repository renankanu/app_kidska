import 'package:flutter/material.dart';

import 'components/home_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                HomeCard(),
                HomeCard(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                HomeCard(),
                HomeCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
