import 'dart:io';

import 'package:app_kidska/app/shared/components/cloud_sun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../routes/app_pages.dart';
import '../../shared/images.dart';
import 'components/home_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  @override
  void initState() {
    loadBanner();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    );
    _bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          const CloudSun(
            top: 0,
            left: 0,
            height: 80,
            icon: AppImages.cloud00,
          ),
          const CloudSun(
            top: 20,
            right: 0,
            height: 50,
            icon: AppImages.cloud01,
          ),
          CloudSun(
            top: 60,
            right: width / 2,
            height: 60,
            icon: AppImages.cloud02,
          ),
          CloudSun(
            top: 0,
            left: width / 2,
            height: 60,
            icon: AppImages.cloud02,
          ),
          Positioned(
            top: height * 0.06,
            right: 0,
            left: 0,
            child: Image.asset(
              AppImages.appIcon,
              height: 20,
              color: Colors.black,
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.stories),
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.icMic,
                            height: 40,
                          ),
                          const Text(
                            'Histórias contadas',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeCard(
                        icon: AppImages.icNumbers,
                        label: 'Números',
                        onTap: () => Get.toNamed(Routes.numbers),
                      ),
                      HomeCard(
                        icon: AppImages.icLetters,
                        label: 'Letras',
                        onTap: () => Get.toNamed(Routes.alphabet),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeCard(
                        icon: AppImages.icDog,
                        label: 'Animais',
                        height: 60,
                        width: 60,
                        onTap: () => Get.toNamed(Routes.animals),
                      ),
                      HomeCard(
                        icon: AppImages.icColors,
                        label: 'Cores',
                        onTap: () => Get.toNamed(Routes.colors),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // TODO: Adicionar anúncio
          // if (_isLoaded)
          //   Align(
          //     alignment: Alignment.bottomCenter,
          //     child: SizedBox(
          //       height: 50,
          //       child: AdWidget(ad: _bannerAd!),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
