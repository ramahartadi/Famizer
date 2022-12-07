import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:signup/signup.dart';


class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      //Sementara
      GoRoute(
        path: '/',
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
          GoRoute(
            path: 'editProfile',
            name: 'editProfile',
            builder: (context, state) {
              return const EditProfilePage();
            },
          ),
          GoRoute(
            path: 'home',
            name: 'home',
            builder: (context, state) {
              return const HomePage();
            },
          ),
        ],
      ),
    ],
  );
}
