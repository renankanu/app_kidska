import 'dart:collection';
import 'dart:developer';

import 'package:app_kidska/models/stories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class StoriesController extends ChangeNotifier {
  bool isLoading = false;
  bool isLogged = false;
  final List<Stories> _stories = [];
  Stories? selectedStory;

  UnmodifiableListView<Stories> get stories => UnmodifiableListView(_stories);

  final databaseReference = FirebaseDatabase.instance.ref();

  Future<void> loginFirebase() async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'renankanu@gmail.com',
        password: 'Kd2f@7Gx8s#zL6t!',
      );
      isLogged = true;
      notifyListeners();
      await _listAllStories();
    } on Exception catch (_) {
      isLogged = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> _listAllStories() async {
    _stories.clear();
    try {
      final stories =
          await databaseReference.child('stories').child('all').once();
      if (stories.snapshot.value == null) {
        return;
      }
      final firebaseMessages = stories.snapshot.value! as Map<dynamic, dynamic>;
      final firebaseResult = List<Stories>.from(
        firebaseMessages.entries.map(
          (entry) => Stories(
            id: entry.key as String,
            name: entry.value['name'] as String,
            image: entry.value['image'] as String,
            urlAudio: entry.value['url_audio'] as String,
          ),
        ),
      );
      _stories.addAll(firebaseResult);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void selectStory(Stories story) {
    selectedStory = story;
    notifyListeners();
  }
}
