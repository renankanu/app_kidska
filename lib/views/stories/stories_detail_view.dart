import 'dart:async';
import 'dart:developer';

import 'package:app_kidska/controllers/stories_controller.dart';
import 'package:app_kidska/shared/colors.dart';
import 'package:app_kidska/shared/components/app_bar.dart';
import 'package:app_kidska/shared/extensions/timer_extension.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../../shared/components/app_cached_image.dart';

class StoriesDetailView extends StatefulWidget {
  const StoriesDetailView({super.key});

  @override
  State<StoriesDetailView> createState() => _StoriesDetailViewState();
}

class _StoriesDetailViewState extends State<StoriesDetailView> {
  final AudioPlayer _player = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  StreamSubscription<PlayerState>? _playerListener;

  @override
  void initState() {
    _getDuration();
    super.initState();
  }

  @override
  void dispose() {
    _playerListener?.cancel();
    _player.dispose();
    super.dispose();
  }

  Future<void> _getDuration() async {
    final storyController = context.read<StoriesController>();
    final story = storyController.selectedStory;
    _playerListener = _player.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        _player.seek(const Duration());
        _player.pause();
      }
    });
    _player.setUrl(story!.urlAudio);
    _duration = await _player.setUrl(story.urlAudio) ?? Duration.zero;
    _player.positionStream.listen((duration) {
      _position = duration;
      if (mounted) {
        setState(() {});
      }
    });
    setState(() {});
  }

  double get _getValueSlider {
    final slideValue = _position.inMicroseconds / _duration.inMicroseconds;
    if (slideValue.isNaN) {
      return 0;
    }
    return slideValue;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Consumer<StoriesController>(
        builder: (context, storiesController, _) {
          final story = storiesController.selectedStory;
          final isFirst = storiesController.isFirst;
          final isLast = storiesController.isLast;
          _getDuration();
          log('isFirst: $isFirst');
          log('isLast: $isLast');
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: AppCachedImage(
                    height: size.height * 0.4,
                    width: size.width * 0.9,
                    radius: 10,
                    imageUrl: story!.image,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  story.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SliderTheme(
                  data: const SliderThemeData(
                    activeTrackColor: AppColor.mandy,
                    inactiveTrackColor: AppColor.celeste,
                    trackHeight: 5,
                    inactiveTickMarkColor: Colors.transparent,
                    thumbColor: AppColor.tradewind,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Slider(
                      value: _getValueSlider,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_position.formatDuration()),
                      Text(_duration.formatDuration())
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!isFirst) {
                          storiesController.previousStory();
                        }
                      },
                      child: Icon(
                        Icons.skip_previous,
                        color: isFirst ? Colors.grey : AppColor.mandy,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        if (_player.playerState.playing) {
                          _player.pause();
                        } else {
                          _player.play();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.tradewind,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: _player.playerState.playing
                              ? const Icon(
                                  Icons.pause,
                                  size: 24,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  size: 24,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => storiesController.nextStory(),
                      child: Icon(
                        Icons.skip_next,
                        color: isLast ? Colors.grey : AppColor.mandy,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
