import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/models/stories.dart';

class StoryController extends GetxController {
  final _isLoading = false.obs;
  final _stories = <Stories>[].obs;
  final _hasError = false.obs;
  final _errorMessage = ''.obs;
  final _selectedStory = Rxn<Stories>();
  final _duration = Rx<Duration>(Duration.zero);
  final _position = Rx<Duration>(Duration.zero);
  final _isLoadingAudio = false.obs;

  bool get isLoading => _isLoading.value;
  List<Stories> get stories => _stories.toList();
  bool get hasError => _hasError.value;
  String get errorMessage => _errorMessage.value;
  Stories? get selectedStory => _selectedStory.value;
  Duration get duration => _duration.value;
  Duration get position => _position.value;
  bool get isLoadingAudio => _isLoadingAudio.value;

  final databaseReference = FirebaseDatabase.instance.ref();
  AudioPlayer player = AudioPlayer();
  StreamSubscription<PlayerState>? playerListener;

  @override
  Future<void> onInit() async {
    await _loginFirebase();
    ever(_selectedStory, (_) {
      _getDuration();
    });
    super.onInit();
  }

  Future<void> _loginFirebase() async {
    _isLoading.toggle();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'renankanu@gmail.com',
        password: 'Kd2f@7Gx8s#zL6t!',
      );
      await _listAllStories();
    } on Exception catch (_) {
      _hasError.value = true;
      _errorMessage.value = 'Erro ao carregar histórias';
    }
    _isLoading.toggle();
  }

  Future<void> _listAllStories() async {
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
    } on Exception catch (_) {
      _hasError.value = true;
      _errorMessage.value = 'Erro ao carregar histórias';
    }
  }

  void selectStory(Stories story) {
    _selectedStory.value = story;
  }

  void nextStory() {
    final isLast = _stories.indexOf(selectedStory!) == _stories.length - 1;
    if (isLast) {
      _selectedStory.value = _stories.first;
    } else {
      final index = _stories.indexOf(selectedStory!);
      _selectedStory.value = _stories[index + 1];
    }
  }

  void previousStory() {
    final isFirst = _stories.indexOf(selectedStory!) == 0;
    if (isFirst) {
      _selectedStory.value = _stories.last;
    } else {
      final index = _stories.indexOf(selectedStory!);
      _selectedStory.value = _stories[index - 1];
    }
  }

  Future<void> _getDuration() async {
    await player.dispose();
    player = AudioPlayer();
    _isLoadingAudio.toggle();
    playerListener = player.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        player.seek(const Duration());
        player.pause();
      }
    });
    player.setUrl(selectedStory!.urlAudio);
    _duration.value =
        await player.setUrl(selectedStory!.urlAudio) ?? Duration.zero;
    player.positionStream.listen((duration) {
      _position.value = duration;
    });
    _isLoadingAudio.toggle();
  }

  void clearDuration() {
    _duration.value = Duration.zero;
    _position.value = Duration.zero;
  }
}
