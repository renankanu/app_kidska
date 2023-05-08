import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  Future<void> onInit() async {
    await _loginFirebase();
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
    } on Exception catch (_) {}
    _isLoading.toggle();
  }
}


// class StoriesController extends ChangeNotifier {
//   bool isLoading = false;
//   bool isLogged = false;
//   final List<Stories> _stories = [];
//   Stories? selectedStory;
//   bool isFirst = true;
//   bool isLast = false;

//   UnmodifiableListView<Stories> get stories => UnmodifiableListView(_stories);

//   final databaseReference = FirebaseDatabase.instance.ref();

//   Future<void> loginFirebase() async {
//     isLoading = true;
//     notifyListeners();
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: 'renankanu@gmail.com',
//         password: 'Kd2f@7Gx8s#zL6t!',
//       );
//       isLogged = true;
//       notifyListeners();
//       await _listAllStories();
//     } on Exception catch (_) {
//       isLogged = false;
//       notifyListeners();
//     }
//     isLoading = false;
//     notifyListeners();
//   }

//   Future<void> _listAllStories() async {
//     _stories.clear();
//     try {
//       final stories =
//           await databaseReference.child('stories').child('all').once();
//       if (stories.snapshot.value == null) {
//         return;
//       }
//       final firebaseMessages = stories.snapshot.value! as Map<dynamic, dynamic>;
//       final firebaseResult = List<Stories>.from(
//         firebaseMessages.entries.map(
//           (entry) => Stories(
//             id: entry.key as String,
//             name: entry.value['name'] as String,
//             image: entry.value['image'] as String,
//             urlAudio: entry.value['url_audio'] as String,
//           ),
//         ),
//       );
//       _stories.addAll(firebaseResult);
//     } on Exception catch (e) {
//       log(e.toString());
//     }
//   }

//   void selectStory(Stories story) {
//     final index = _stories.indexOf(story);
//     if (index == 0) {
//       isFirst = true;
//     }
//     if (index == _stories.length - 1) {
//       isLast = true;
//     }
//     selectedStory = story;
//     notifyListeners();
//   }

//   void nextStory() {
//     if (selectedStory == null) {
//       return;
//     }
//     final index = _stories.indexOf(selectedStory!);
//     if (index == _stories.length - 1) {
//       isLast = true;
//       return;
//     }
//     selectedStory = _stories[index + 1];
//     notifyListeners();
//   }

//   void previousStory() {
//     if (selectedStory == null) {
//       return;
//     }
//     final index = _stories.indexOf(selectedStory!);
//     if (index == 0) {
//       isFirst = true;
//       return;
//     }
//     selectedStory = _stories[index - 1];
//     notifyListeners();
//   }
// }

