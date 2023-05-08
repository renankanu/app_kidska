import 'package:app_kidska/app/shared/colors.dart';
import 'package:app_kidska/app/shared/components/app_bar.dart';
import 'package:app_kidska/app/shared/extensions/timer_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/components/app_cached_image.dart';
import '../controllers/story_controller.dart';

class StoriesDetailView extends StatefulWidget {
  const StoriesDetailView({super.key});

  @override
  State<StoriesDetailView> createState() => _StoriesDetailViewState();
}

class _StoriesDetailViewState extends State<StoriesDetailView> {
  final controller = Get.find<StoryController>();

  @override
  void dispose() {
    controller.player.stop();
    controller.clearDuration();
    super.dispose();
  }

  double get _getValueSlider {
    final slideValue =
        controller.position.inMicroseconds / controller.duration.inMicroseconds;
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
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: AppCachedImage(
                      height: size.height * 0.4,
                      width: size.width * 0.9,
                      radius: 10,
                      imageUrl: controller.selectedStory!.image,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.selectedStory!.name,
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
                        Text(controller.position.formatDuration()),
                        Text(controller.duration.formatDuration())
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: controller.previousStory,
                        child: const Icon(
                          Icons.skip_previous,
                          color: AppColor.mandy,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          if (controller.player.playerState.playing) {
                            controller.player.pause();
                          } else {
                            controller.player.play();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.tradewind,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: controller.player.playerState.playing
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
                        onTap: controller.nextStory,
                        child: const Icon(
                          Icons.skip_next,
                          color: AppColor.mandy,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (controller.isLoadingAudio)
              Container(
                height: size.height,
                width: size.width,
                color: Colors.black.withOpacity(0.6),
                child: Center(
                  child: Card(
                    child: SizedBox(
                      width: size.width * 0.5,
                      child: Lottie.asset(
                        'assets/images/app/loading.json',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
