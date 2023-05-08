import 'package:app_kidska/app/modules/stories/controllers/story_controller.dart';
import 'package:app_kidska/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/components/app_bar.dart';
import '../../../shared/components/app_cached_image.dart';

class StoriesView extends GetView<StoryController> {
  const StoriesView({super.key});

  Widget _renderBody() {
    if (controller.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (controller.hasError) {
      return Center(
        child: Text(controller.errorMessage),
      );
    }

    if (controller.stories.isEmpty) {
      return const Center(
        child: Text('Não há histórias'),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      itemCount: controller.stories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final story = controller.stories[index];
        return GestureDetector(
          onTap: () {
            controller.selectStory(story);
            Get.toNamed(Routes.storiesDetail);
          },
          child: SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              children: [
                AppCachedImage(
                  imageUrl: story.image,
                  radius: 10,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.black54,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Text(
                      story.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Obx(_renderBody),
    );
  }
}
