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

// class SnackbarInitial extends UserState {}

// class SnackbarSuccessAppear extends UserState {}

// class SnackbarErrorAppear extends UserState {}