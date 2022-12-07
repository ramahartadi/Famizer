import 'package:go_router/go_router.dart';
import 'package:home/home.dart';

class AppRouter {
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
            path: 'editProfile',
            name: 'editProfile',
            builder: (context, state) {
              return EditProfilePage();
            },
          ),
        ],
      ),
    ],
  );
}
