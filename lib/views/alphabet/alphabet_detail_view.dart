import 'package:app_kidska/models/alphabet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/colors.dart';
import '../../shared/components/app_bar.dart';
import '../../shared/components/cloud_sun.dart';
import '../../shared/images.dart';

class AlphabetDetailView extends StatelessWidget {
  const AlphabetDetailView({
    super.key,
    required this.alphabet,
  });

  final Alphabet alphabet;

  String get iconByName {
    switch (alphabet) {
      case Alphabet.a:
        return AppImages.a;
      case Alphabet.b:
        return AppImages.b;
      case Alphabet.c:
        return AppImages.c;
      case Alphabet.d:
        return AppImages.d;
      case Alphabet.e:
        return AppImages.e;
      case Alphabet.f:
        return AppImages.f;
      case Alphabet.g:
        return AppImages.g;
      case Alphabet.h:
        return AppImages.h;
      case Alphabet.i:
        return AppImages.i;
      case Alphabet.j:
        return AppImages.j;
      case Alphabet.k:
        return AppImages.k;
      case Alphabet.l:
        return AppImages.l;
      case Alphabet.m:
        return AppImages.m;
      case Alphabet.n:
        return AppImages.n;
      case Alphabet.o:
        return AppImages.o;
      case Alphabet.p:
        return AppImages.p;
      case Alphabet.q:
        return AppImages.q;
      case Alphabet.r:
        return AppImages.r;
      case Alphabet.s:
        return AppImages.s;
      case Alphabet.t:
        return AppImages.t;
      case Alphabet.u:
        return AppImages.u;
      case Alphabet.v:
        return AppImages.v;
      case Alphabet.w:
        return AppImages.w;
      case Alphabet.x:
        return AppImages.x;
      case Alphabet.y:
        return AppImages.y;
      case Alphabet.z:
        return AppImages.z;
      default:
        return AppImages.a;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Stack(
        children: [
          const CloudSun(
            top: 0,
            left: -20,
            height: 120,
          ),
          CloudSun(
            bottom: 80,
            right: 0,
            height: 120,
            icon: AppImages.cloudTwo,
            color: AppColor.malibu.withOpacity(0.5),
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: alphabet,
                  child: SvgPicture.asset(
                    iconByName,
                    height: height * 0.25,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  alphabet.letterOf,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
