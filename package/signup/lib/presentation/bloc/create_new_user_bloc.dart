import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/data/datasources/user_repository.dart';

part 'create_new_user_event.dart';
part 'create_new_user_state.dart';

class CreateNewUserBloc extends Bloc<CreateNewUserEvent, CreateNewUserState> {
  final UserRepository userRepository;
  CreateNewUserBloc({required this.userRepository}) : super(InitialState()) {
    on<Create>((event, emit) async {
      emit(UserAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        userRepository.create(
            userId: event.userId, name: event.name, email: event.email);
        emit(UserAdded());
      } catch (e) {
        print(e);
      }
    });
  }
}
