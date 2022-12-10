import 'package:authentication/data/repositories/auth_repository.dart';
import 'package:authentication/presentation/blocs/blocs.dart';
import 'package:authentication/presentation/cubits/cubits.dart';
import 'package:famizer/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/theme.dart';
import 'package:dynamic_color/dynamic_color.dart';

class FamizerApp extends StatelessWidget {
  const FamizerApp({
    super.key,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

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

        return RepositoryProvider.value(
          value: _authRepository,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AppBloc(authRepository: _authRepository),
              ),
              BlocProvider(
                create: (context) => LoginCubit(context.read<AuthRepository>()),
              ),
              BlocProvider(
                create: (context) =>
                    SignupCubit(context.read<AuthRepository>()),
              ),
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
                routerConfig:
                    AppRouter(appBloc: context.read<AppBloc>()).router,
              );
            }),
          ),
        );
      },
    );
  }
}
