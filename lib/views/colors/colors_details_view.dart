import 'dart:async';

import 'package:app_kidska/shared/components/app_bar.dart';
import 'package:app_kidska/shared/components/audio_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../models/colors.dart';
import '../../shared/components/cloud_sun.dart';
import '../../shared/images.dart';
import '../../shared/sounds.dart';

class ColorsDetailView extends StatefulWidget {
  const ColorsDetailView({
    super.key,
    required this.color,
  });

  final ModelColors color;

  @override
  State<ColorsDetailView> createState() => _ColorsDetailViewState();
}

class _ColorsDetailViewState extends State<ColorsDetailView> {
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

  Color _getColor(ModelColors color) {
    switch (color) {
      case ModelColors.red:
        return Colors.red;
      case ModelColors.blue:
        return Colors.blue;
      case ModelColors.green:
        return Colors.green;
      case ModelColors.yellow:
        return Colors.yellow;
      case ModelColors.pink:
        return const Color(0xFFFFCBDB);
      case ModelColors.black:
        return Colors.black;
      case ModelColors.brown:
        return const Color(0xFF964B00);
      case ModelColors.orange:
        return const Color(0xFFFFA500);
      default:
        return Colors.amber;
    }
  }

  String get _getSong {
    switch (widget.color) {
      case ModelColors.red:
        return AppSounds.red;
      case ModelColors.blue:
        return AppSounds.blue;
      case ModelColors.green:
        return AppSounds.green;
      case ModelColors.yellow:
        return AppSounds.yellow;
      case ModelColors.pink:
        return AppSounds.pink;
      case ModelColors.black:
        return AppSounds.black;
      case ModelColors.brown:
        return AppSounds.brown;
      case ModelColors.orange:
        return AppSounds.orange;
      default:
        return AppSounds.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Stack(
        children: [
          const CloudSun(
            top: 0,
            left: -6,
            height: 400,
            icon: AppImages.bgColor,
            opacity: 0.1,
          ),
          const CloudSun(
            bottom: -10,
            right: -6,
            height: 100,
            icon: AppImages.bgColor,
            opacity: 0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 240,
                  width: 240,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: widget.color.description,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: _getColor(widget.color),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.color.description,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _getColor(widget.color),
                          ),
                        ),
                      ],
                    ),
                  ),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
