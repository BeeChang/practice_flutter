import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/model/CustomData.dart';
import 'package:practice_flutter/ui/go_router/GoCartScreen.dart';
import 'package:practice_flutter/ui/go_router/InnerProfileInfo.dart';

import '../home/HomeScreen.dart';
import '../MainScreen.dart';
import '../NotificationScreen.dart';
import '../ProfileScreen.dart';
import '../SearchScreen.dart';
import 'ProductScreen.dart';
import 'ScaffoldWithNavBar.dart';

final router = GoRouter(
  initialLocation: '/',



  routes: [
    // 상품과 카트 라우트를 최상위로 이동
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id'] ?? '';
        final extraData = state.extra as Map<String, dynamic>?;
        return ProductScreen(
          productId: productId,
          intValue: extraData?['intValue'] as int? ?? 0,
          stringValue: extraData?['stringValue'] as String? ?? '',
          customData: extraData?['customData'] as CustomData?,
        );
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const GoCartScreen(),
    ),

    // 바텀 네비게이션을 위한 StatefulShellRoute
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        // 홈 탭
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        // 검색 탭
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) {
                final fromCart = (state.extra as Map<String, dynamic>?)?['fromCart'] as bool? ?? false;
                return SearchScreen(fromCart: fromCart);
              },
            ),
          ],
        ),
        // 알림 탭
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notification',
              builder: (context, state) => const NotificationScreen(),
            ),
          ],
        ),
        // 프로필 탭
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
            GoRoute(
              path: '/profile/info',
              builder: (context, state) => const InnerProfileInfo(),
            ),
          ],
        ),
      ],
    ),
  ],
);