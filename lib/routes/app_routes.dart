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
            path: _numberDetail,
            builder: (BuildContext context, GoRouterState state) {
              return const NumberDetailView();
            },
          ),
        ],
      ),
    ],
  );
}
