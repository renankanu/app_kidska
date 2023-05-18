import 'dart:async';

import 'package:app_kidska/app/data/models/animals.dart';
import 'package:app_kidska/app/shared/components/app_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core_controller.dart';
import '../../shared/colors.dart';
import '../../shared/components/audio_button.dart';
import '../../shared/components/cloud_sun.dart';
import '../../shared/images.dart';
import '../../shared/sounds.dart';

class AnimalDetailView extends StatefulWidget {
  const AnimalDetailView({
    super.key,
  });

  @override
  State<AnimalDetailView> createState() => _AnimalDetailViewState();
}

class _AnimalDetailViewState extends State<AnimalDetailView> {
  late Animals animals;
  final _player = AudioPlayer();
  bool _isPlaying = false;
  StreamSubscription<PlayerState>? _playerListener;
  final coreController = Get.find<CoreController>();

  @override
  void initState() {
    animals = Get.arguments as Animals;
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
    switch (animals) {
      case Animals.dog:
        return AppImages.dog;
      case Animals.cat:
        return AppImages.cat;
      case Animals.cow:
        return AppImages.cow;
      case Animals.duck:
        return AppImages.duck;
      case Animals.elephant:
        return AppImages.elephant;
      case Animals.horse:
        return AppImages.horse;
      case Animals.lion:
        return AppImages.lion;
      case Animals.chicken:
        return AppImages.chicken;
      default:
        return AppImages.dog;
    }
  }

  String get _getSong {
    switch (animals) {
      case Animals.dog:
        return AppSounds.dog;
      case Animals.cat:
        return AppSounds.cat;
      case Animals.cow:
        return AppSounds.cow;
      case Animals.duck:
        return AppSounds.duck;
      case Animals.elephant:
        return AppSounds.elephant;
      case Animals.horse:
        return AppSounds.horse;
      case Animals.lion:
        return AppSounds.lion;
      case Animals.chicken:
        return AppSounds.chicken;
      default:
        return AppSounds.dog;
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
            top: 20,
            right: 0,
            height: 80,
            icon: AppImages.cloudTwo,
            opacity: 0.3,
          ),
          const CloudSun(
            bottom: 0,
            left: 0,
            height: 220,
            opacity: 0.3,
            icon: AppImages.tree,
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: animals,
                  child: SvgPicture.asset(
                    iconByName,
                    height: height * 0.25,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  animals.description,
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
                  buttonColor: AppColor.hitPink,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
