import 'package:authentication/data/repositories/auth_repository.dart';
import 'package:authentication/presentation/blocs/blocs.dart';
import 'package:authentication/presentation/cubits/cubits.dart';
import 'package:get_it/get_it.dart';
import 'package:signup/signup.dart';

final locator = GetIt.instance;
void init() {
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => UserRepository());

  locator.registerFactory(() => AppBloc(authRepository: locator()));
  locator.registerFactory(() => LoginCubit(locator()));
  locator.registerFactory(() => SignupCubit(locator()));
  locator.registerFactory(() => CreateNewUserBloc(userRepository: locator()));
}
