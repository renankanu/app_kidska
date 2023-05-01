import 'package:app_kidska/models/numbers.dart';
import 'package:app_kidska/views/home/home_view.dart';
import 'package:app_kidska/views/numbers/number_detail_view.dart';
import 'package:app_kidska/views/numbers/numbers_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();

  static const String _home = '/';
  static const String _numbers = 'numbers';
  static const String _numberDetail = 'number_detail';

  static const String numbers = '/$_numbers';
  static const String numberDetail = '/$_numberDetail';

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
            builder: (BuildContext context, GoRouterState state) {
              return const NumbersView();
            },
          ),
          GoRoute(
            path: '$_numberDetail/:number',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: NumberDetailView(
                number: Numbers.values[int.parse(state.params['number']!)],
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
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
