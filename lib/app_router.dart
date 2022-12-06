import 'package:go_router/go_router.dart';
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
        ],
      ),
    ],
  );
}
