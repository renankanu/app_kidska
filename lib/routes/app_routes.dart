import 'package:app_kidska/models/alphabet.dart';
import 'package:app_kidska/models/numbers.dart';
import 'package:app_kidska/views/alphabet/alphabet_detail_view.dart';
import 'package:app_kidska/views/home/home_view.dart';
import 'package:app_kidska/views/numbers/number_detail_view.dart';
import 'package:app_kidska/views/numbers/numbers_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/alphabet/alphabet_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String _home = '/';
  static const String _numbers = 'numbers';
  static const String _numberDetail = 'number_detail';
  static const String _alphabet = 'alphabet';
  static const String _alphabetDetail = 'alphabet_detail';

  static const String numbers = '/$_numbers';
  static const String numberDetail = '/$_numberDetail';
  static const String alphabet = '/$_alphabet';
  static const String alphabetDetail = '/$_alphabetDetail';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: _home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: _numbers,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const NumbersView(),
              transitionsBuilder: (_, animation, __, child) => SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
          ),
          GoRoute(
            path: '$_numberDetail/:number',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: NumberDetailView(
                number: Numbers.values[int.parse(state.params['number']!)],
              ),
              transitionsBuilder: (_, animation, __, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: _alphabet,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const AlphabetView(),
              transitionsBuilder: (_, animation, __, child) => SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
          ),
          GoRoute(
            path: '$_alphabetDetail/:letter',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: AlphabetDetailView(
                alphabet: Alphabet.values.firstWhere(
                  (element) => element.description == state.params['letter'],
                ),
              ),
              transitionsBuilder: (_, animation, __, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
        ],
      ),
    ],
  );
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ));

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
