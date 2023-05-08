import 'package:app_kidska/app/modules/alphabet/alphabet_detail_view.dart';
import 'package:app_kidska/app/modules/alphabet/alphabet_view.dart';
import 'package:app_kidska/app/modules/animals/animal_detail_view.dart';
import 'package:app_kidska/app/modules/animals/animals_view.dart';
import 'package:app_kidska/app/modules/colors/colors_details_view.dart';
import 'package:app_kidska/app/modules/numbers/number_detail_view.dart';
import 'package:app_kidska/app/modules/numbers/numbers_view.dart';
import 'package:app_kidska/app/modules/stories/bindings/story_binding.dart';
import 'package:get/get.dart';

import '../modules/colors/colors_view.dart';
import '../modules/home/home_view.dart';
import '../modules/stories/views/stories_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.numbers,
      page: () => const NumbersView(),
    ),
    GetPage(
      name: _Paths.numbersDetail,
      page: () => const NumberDetailView(),
    ),
    GetPage(
      name: _Paths.alphabet,
      page: () => const AlphabetView(),
    ),
    GetPage(
      name: _Paths.alphabetDetail,
      page: () => const AlphabetDetailView(),
    ),
    GetPage(
      name: _Paths.animals,
      page: () => const AnimalsView(),
    ),
    GetPage(
      name: _Paths.animalsDetail,
      page: () => const AnimalDetailView(),
    ),
    GetPage(
      name: _Paths.colors,
      page: () => const ColorsView(),
    ),
    GetPage(
      name: _Paths.colorsDetail,
      page: () => const ColorsDetailView(),
    ),
    GetPage(
      name: _Paths.stories,
      page: () => const StoriesView(),
      binding: StoryBinding(),
    ),
  ];
}
