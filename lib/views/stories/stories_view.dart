import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/stories_controller.dart';
import '../../models/stories.dart';
import '../../shared/components/app_cached_image.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  bool isLoading = true;
  bool isLogged = false;
  List<Stories> stories = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<StoriesController>().loginFirebase();
    });
    super.initState();
  }

  Widget _renderBody() {
    final paddingTop = MediaQuery.of(context).padding.top;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!isLogged) {
      return const Center(
        child: Text('Não foi possível fazer o login'),
      );
    }

    if (stories.isEmpty) {
      return const Center(
        child: Text('Não há histórias'),
      );
    }

    return Consumer<StoriesController>(
      builder: (context, storiesController, _) {
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(20, 20 + paddingTop, 20, 0),
          itemCount: storiesController.stories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final story = storiesController.stories[index];
            return SizedBox(
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
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    isLoading = context.watch<StoriesController>().isLoading;
    isLogged = context.watch<StoriesController>().isLogged;
    stories = context.watch<StoriesController>().stories;

    return Scaffold(
      body: _renderBody(),
    );
  }
}
