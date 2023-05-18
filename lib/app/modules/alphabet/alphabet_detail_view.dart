import 'dart:async';

import 'package:app_kidska/app/data/models/alphabet.dart';
import 'package:app_kidska/app/shared/components/audio_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core_controller.dart';
import '../../shared/colors.dart';
import '../../shared/components/app_bar.dart';
import '../../shared/components/cloud_sun.dart';
import '../../shared/images.dart';
import '../../shared/sounds.dart';

class AlphabetDetailView extends StatefulWidget {
  const AlphabetDetailView({
    super.key,
  });

  @override
  State<AlphabetDetailView> createState() => _AlphabetDetailViewState();
}

class _AlphabetDetailViewState extends State<AlphabetDetailView> {
  late Alphabet alphabet;
  final _player = AudioPlayer();
  bool _isPlaying = false;
  StreamSubscription<PlayerState>? _playerListener;
  final coreController = Get.find<CoreController>();

  @override
  void initState() {
    alphabet = Get.arguments as Alphabet;
    _playerListener = _player.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.playing) {
        setState(() {
          _isPlaying = true;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
      }
    });
    _showADS();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _playerListener?.cancel();
      _player.release();
    });
    super.dispose();
  }

  void _showADS() {
    coreController.showInterstitialAd();
  }

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

  String get _getSong {
    switch (alphabet) {
      case Alphabet.a:
        return AppSounds.a;
      case Alphabet.b:
        return AppSounds.b;
      case Alphabet.c:
        return AppSounds.c;
      case Alphabet.d:
        return AppSounds.d;
      case Alphabet.e:
        return AppSounds.e;
      case Alphabet.f:
        return AppSounds.f;
      case Alphabet.g:
        return AppSounds.g;
      case Alphabet.h:
        return AppSounds.h;
      case Alphabet.i:
        return AppSounds.i;
      case Alphabet.j:
        return AppSounds.j;
      case Alphabet.k:
        return AppSounds.k;
      case Alphabet.l:
        return AppSounds.l;
      case Alphabet.m:
        return AppSounds.m;
      case Alphabet.n:
        return AppSounds.n;
      case Alphabet.o:
        return AppSounds.o;
      case Alphabet.p:
        return AppSounds.p;
      case Alphabet.q:
        return AppSounds.q;
      case Alphabet.r:
        return AppSounds.r;
      case Alphabet.s:
        return AppSounds.s;
      case Alphabet.t:
        return AppSounds.t;
      case Alphabet.u:
        return AppSounds.u;
      case Alphabet.v:
        return AppSounds.v;
      case Alphabet.w:
        return AppSounds.w;
      case Alphabet.x:
        return AppSounds.x;
      case Alphabet.y:
        return AppSounds.y;
      case Alphabet.z:
        return AppSounds.z;
      default:
        return AppSounds.a;
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
                const SizedBox(height: 20),
                AudioButton(
                  onTap: () {
                    _isPlaying
                        ? _player.stop()
                        : _player.play(AssetSource(_getSong));
                    setState(() {});
                  },
                  isPlaying: _isPlaying,
                  buttonColor: AppColor.tradewind,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
