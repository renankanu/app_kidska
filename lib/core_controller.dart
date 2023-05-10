import 'dart:developer';

import 'package:get/get.dart';

class CoreController extends GetxController {
  final _taps = RxInt(0);

  int get taps => _taps.value;

  void incrementTap() {
    log('Taps: ${_taps.value}');
    _taps.value++;
  }

  void zeroTaps() {
    _taps.value = 0;
  }
}
