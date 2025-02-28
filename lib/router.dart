import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_navbar/screens/loginpage.dart';
import 'package:router_navbar/screens/newsdetailpage.dart';
import 'package:router_navbar/screens/newspage.dart';
import 'package:router_navbar/screens/settingspage.dart';
import 'package:router_navbar/screens/signuppage.dart';
import 'package:router_navbar/service/pocketbase_service.dart';

import 'screens/homepage.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

Page<void> noTransitionPageBuilder(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // No animation
    },
  );
}

final router = GoRouter(
    navigatorKey: _parentKey,
    redirect: (context, state) {
      final isAuthenticated = pocketBaseService.isAuthenticated();
      final isLoggingIn = state.matchedLocation == '/login';
      final isSigningUp = state.matchedLocation == '/signup';

      if (!isAuthenticated && !isLoggingIn && !isSigningUp) {
        return '/login'; // Redirect to login if not authenticated and not on login/signu
      }
      if (isAuthenticated && (isLoggingIn || isSigningUp)) {
        return '/'; // Redirect authenticated users away from login/signup pages
      }
      return null;
    },
    routes: [
      ShellRoute(
          navigatorKey: _shellKey,
          builder: (context, state, child) => HomePage(
                child: child,
              ),
          routes: [
            GoRoute(
              path: '/',
              parentNavigatorKey: _shellKey,
              pageBuilder: (context, state) => noTransitionPageBuilder(
                context,
                state,
                const Newspage(),
              ),
            ),
            GoRoute(
              path: SettingsPage.route,
              parentNavigatorKey: _shellKey,
              name: 'settings',
              pageBuilder: (context, state) =>
                  noTransitionPageBuilder(context, state, const SettingsPage()),
            ),
            GoRoute(
              path: '/news',
              parentNavigatorKey: _shellKey,
              pageBuilder: (context, state) {
                return noTransitionPageBuilder(
                  context,
                  state,
                  Newsdetailpage(
                    id: state.uri.queryParameters["id"]!,
                    title: state.uri.queryParameters["title"]!,
                  ),
                );
              },
            )
          ]),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),
    ]);
