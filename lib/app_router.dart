import 'package:go_router/go_router.dart';
import 'package:login/login.dart';

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
      ),
    ],
  );
}
