part of 'create_new_user_bloc.dart';

abstract class CreateNewUserState extends Equatable {}

class InitialState extends CreateNewUserState {
  @override
  List<Object?> get props => [];
}

class UserAdding extends CreateNewUserState {
  @override
  List<Object?> get props => [];
}

class UserAdded extends CreateNewUserState {
  @override
  List<Object?> get props => [];
}
