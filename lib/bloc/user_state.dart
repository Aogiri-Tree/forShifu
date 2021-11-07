part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> user;
  UserLoadedState({required this.user});
}

class UserErrorState extends UserState {
  final dynamic error;
  UserErrorState({required this.error});
}

class UserCachSaveState extends UserState {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;

  UserCachSaveState({this.id, this.name, this.email, this.phone});
}

class UserCachLoadedState extends UserState {}

// class SnackbarInitial extends UserState {}

// class SnackbarSuccessAppear extends UserState {}

// class SnackbarErrorAppear extends UserState {}