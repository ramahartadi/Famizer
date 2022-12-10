import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:signup/signup.dart';
import 'package:events/events.dart';
import 'package:todo/todo.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      //Sementara
      GoRoute(
        path: '/',
        name: 'login',
        builder: (context, state) {
          return const TodoPage();
        },
        routes: [
          GoRoute(
            path: 'signup',
            name: 'signup',
            builder: (context, state) {
              return const SignupPage();
            },
          ),
          GoRoute(
            path: 'editProfile',
            name: 'editProfile',
            builder: (context, state) {
              return EditProfilePage();
            },
          ),
          GoRoute(
            path: 'home',
            name: 'home',
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: 'events',
            name: 'event',
            builder: (context, state) {
              return const EventList();
            },
          ),
          GoRoute(
            path: 'todo',
            name: 'todo',
            builder: (context, state) {
              return const TodoPage();
            },
          )
        ],
      ),
    ],
  );
}
