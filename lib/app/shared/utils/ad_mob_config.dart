import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core_controller.dart';

class AdMobConfig {
  const AdMobConfig._();

  static Future<void> loadInterstitial({
    required String adUnitId,
    required CoreController coreController,
  }) async {
    await InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          if (coreController.taps >= 5) {
            coreController.zeroTaps();
            ad.show();
          }
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }
}
