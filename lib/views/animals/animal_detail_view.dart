import 'dart:async';

import 'package:app_kidska/models/animals.dart';
import 'package:app_kidska/shared/components/app_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/colors.dart';
import '../../shared/components/cloud_sun.dart';
import '../../shared/images.dart';
import '../../shared/sounds.dart';

class AnimalDetailView extends StatefulWidget {
  const AnimalDetailView({
    super.key,
    required this.animals,
  });

  final Animals animals;

  @override
  State<AnimalDetailView> createState() => _AnimalDetailViewState();
}

class _AnimalDetailViewState extends State<AnimalDetailView> {
  final _player = AudioPlayer();
  bool _isPlaying = false;
  StreamSubscription<PlayerState>? _playerListener;

  @override
  void initState() {
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

  String get iconByName {
    switch (widget.animals) {
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
    switch (widget.animals) {
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
                  tag: widget.animals,
                  child: SvgPicture.asset(
                    iconByName,
                    height: height * 0.25,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.animals.description,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _isPlaying
                        ? _player.stop()
                        : _player.play(AssetSource(_getSong));
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColor.hitPink,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: FaIcon(
                        _isPlaying
                            ? FontAwesomeIcons.pause
                            : FontAwesomeIcons.play,
                        color: Colors.white,
                      ),
                    ),
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
