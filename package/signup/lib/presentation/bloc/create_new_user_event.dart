part of 'create_new_user_bloc.dart';

abstract class CreateNewUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Create extends CreateNewUserEvent {
  final String userId;
  final String name;
  final String email;

  Create(this.userId, this.name, this.email);
  @override
  List<Object?> get props => [userId, name, email];
}
