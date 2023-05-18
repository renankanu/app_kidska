import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CoreController extends GetxController {
  final _taps = RxInt(0);

  int get taps => _taps.value;

  InterstitialAd? _interstitialAd;
  late String _adUnitId;

  @override
  Future<void> onInit() async {
    if (kReleaseMode) {
      _adUnitId = Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910';
    } else {
      _adUnitId =
          Platform.isAndroid ? 'ca-app-pub-4031327619307152/9498803575' : '';
    }
    await InterstitialAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
    super.onInit();
  }

  void incrementTap() {
    log('Taps: ${_taps.value}');
    _taps.value++;
  }

  void zeroTaps() {
    _taps.value = 0;
  }

  Future<void> showInterstitialAd() async {
    log('Taps: ${_taps.value}');
    if (taps >= 5 && _interstitialAd != null) {
      await _interstitialAd!.show();
      zeroTaps();
    }
  }
}
