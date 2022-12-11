import 'package:authentication/data/repositories/auth_repository.dart';
import 'package:authentication/presentation/blocs/blocs.dart';
import 'package:authentication/presentation/cubits/cubits.dart';
import 'package:famizer/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/data/datasources/user_repository.dart';
import 'package:signup/presentation/bloc/create_new_user_bloc.dart';
import 'package:theme/theme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:famizer/injection.dart' as di;

class FamizerApp extends StatelessWidget {
  const FamizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          lightCustomColors = lightCustomColors.harmonized(lightScheme);

          // Repeat for the dark color scheme.
          darkScheme = darkDynamic.harmonized();
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          // Otherwise, use fallback schemes.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }

        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
                create: (context) => di.locator<AuthRepository>()),
            RepositoryProvider(
                create: (context) => di.locator<UserRepository>())
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => di.locator<AppBloc>()),
              BlocProvider(
                  create: (context) => di.locator<CreateNewUserBloc>()),
              BlocProvider(create: (context) => di.locator<LoginCubit>()),
              BlocProvider(create: (context) => di.locator<SignupCubit>()),
            ],
            child: Builder(builder: (context) {
              return MaterialApp.router(
                theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: lightScheme,
                  extensions: [lightCustomColors],
                ),
                darkTheme: ThemeData(
                  useMaterial3: true,
                  colorScheme: darkScheme,
                  extensions: [darkCustomColors],
                ),
                routerConfig: AppRouter(appBloc: di.locator<AppBloc>()).router,
              );
            }),
          ),
        );
      },
    );
  }
}
