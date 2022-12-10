import 'dart:async';

import 'package:authentication/presentation/blocs/blocs.dart';
import 'package:events/events.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:signup/signup.dart';
import 'package:todo/todo.dart';
import 'package:family/family.dart';
import 'package:settings/settings.dart';

class AppRouter {
  final AppBloc appBloc;
  AppRouter({required this.appBloc});

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      //Sementara
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (context, state) {
              return const SettingPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginPage();
        },
        routes: [
          GoRoute(
            path: 'signup',
            name: 'signup',
            builder: (context, state) {
              return const SignupPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/profileRegistration',
        name: 'profileRegistration',
        builder: (context, state) {
          return const ProfileRegistration();
        },
      ),
      GoRoute(
        path: '/editProfile',
        name: 'editProfile',
        builder: (context, state) {
          return const EditProfilePage();
        },
      ),
      GoRoute(
        path: '/events',
        name: 'events',
        builder: (context, state) {
          return const EventList();
        },
      ),
      GoRoute(
        path: '/todo',
        name: 'todo',
        builder: (context, state) {
          return const TodoPage();
        },
      ),
      GoRoute(
        path: '/family',
        name: 'family',
        builder: (context, state) {
          return const FamilyMember();
        },
      )
    ],
    redirect: (context, state) {
      // check if the user is logged in.
      late bool loggedIn =
          appBloc.state.status == AppStatus.authenticated; // cubit
      // check if the user is logging in

      // check current current location
      final bool logginIn = state.subloc == '/login';
      final bool signup = state.subloc == '/login/signup';
      if (signup) {
        return null;
      }
      if (!loggedIn) {
        return logginIn ? null : '/login';
      }
      if (logginIn) {
        return '/';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(appBloc.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
