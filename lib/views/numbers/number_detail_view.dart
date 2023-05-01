import 'dart:async';

import 'package:app_kidska/models/numbers.dart';
import 'package:app_kidska/shared/colors.dart';
import 'package:app_kidska/shared/components/app_bar.dart';
import 'package:app_kidska/shared/images.dart';
import 'package:app_kidska/shared/sounds.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumberDetailView extends StatefulWidget {
  const NumberDetailView({
    super.key,
    required this.number,
  });

  final Numbers number;

  @override
  State<NumberDetailView> createState() => _NumberDetailViewState();
}

class _NumberDetailViewState extends State<NumberDetailView> {
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
  Future<void> dispose() async {
    _playerListener?.cancel();
    _player.dispose();
    super.dispose();
  }

  String get iconByName {
    switch (widget.number) {
      case Numbers.zero:
        return AppImages.numbersZero;
      case Numbers.one:
        return AppImages.numbersOne;
      case Numbers.two:
        return AppImages.numbersTwo;
      case Numbers.three:
        return AppImages.numbersThree;
      case Numbers.four:
        return AppImages.numbersFour;
      case Numbers.five:
        return AppImages.numbersFive;
      case Numbers.six:
        return AppImages.numbersSix;
      case Numbers.seven:
        return AppImages.numbersSeven;
      case Numbers.eight:
        return AppImages.numbersEight;
      case Numbers.nine:
        return AppImages.numbersNine;
      default:
        return AppImages.numbersZero;
    }
  }

  String get getSound {
    switch (widget.number) {
      case Numbers.zero:
        return AppSounds.zero;
      case Numbers.one:
        return AppSounds.one;
      case Numbers.two:
        return AppSounds.two;
      case Numbers.three:
        return AppSounds.three;
      case Numbers.four:
        return AppSounds.four;
      case Numbers.five:
        return AppSounds.five;
      case Numbers.six:
        return AppSounds.six;
      case Numbers.seven:
        return AppSounds.seven;
      case Numbers.eight:
        return AppSounds.eight;
      case Numbers.nine:
        return AppSounds.nine;
      default:
        return AppSounds.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.springWood,
      appBar: const BaseAppBar(),
      body: Stack(
        children: [
          const Cloud(
            top: 0,
            left: -20,
            height: 120,
          ),
          const Cloud(
            bottom: 0,
            right: 0,
            height: 120,
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.number.value,
                  child: SvgPicture.asset(
                    iconByName,
                    height: height * 0.15,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.number.name.toUpperCase(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _player.play(AssetSource(getSound));
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColor.tradewind,
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
          ),
        ],
      ),
    );
  }
}

class Cloud extends StatelessWidget {
  const Cloud({
    super.key,
    this.bottom,
    this.right,
    this.left,
    this.top,
    this.height = 90,
  });

  final double? bottom;
  final double? right;
  final double? left;
  final double? top;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      left: left,
      top: top,
      child: SvgPicture.asset(
        AppImages.cloudOne,
        height: height,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          AppColor.malibu.withOpacity(0.2),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
