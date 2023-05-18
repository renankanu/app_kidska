import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CoreController extends GetxController {
  final _taps = RxInt(0);
  final _isBannerAdLoaded = RxBool(false);

  int get taps => _taps.value;
  bool get isBannerAdLoaded => _isBannerAdLoaded.value;

  BannerAd? bannerAd;
  InterstitialAd? _interstitialAd;
  late String _adBannerId;
  late String _adInterstitialId;

  @override
  Future<void> onInit() async {
    await _initBannerAd();
    await _initInterstitialAd();
    super.onInit();
  }

  Future<void> _initBannerAd() async {
    if (kReleaseMode) {
      _adBannerId =
          Platform.isAndroid ? 'ca-app-pub-4031327619307152/3068254458' : '';
    } else {
      _adBannerId = Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716';
    }
    bannerAd = BannerAd(
      adUnitId: _adBannerId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    );
    bannerAd!.load();
  }

  Future<void> _initInterstitialAd() async {
    if (kReleaseMode) {
      _adInterstitialId =
          Platform.isAndroid ? 'ca-app-pub-4031327619307152/9498803575' : '';
    } else {
      _adInterstitialId = Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910';
    }
    await InterstitialAd.load(
      adUnitId: _adInterstitialId,
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

  @override
  void onClose() {
    _interstitialAd?.dispose();
    super.onClose();
  }
}
