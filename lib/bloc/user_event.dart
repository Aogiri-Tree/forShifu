part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserLoadedEvent extends UserEvent {}

class UserResetEvent extends UserEvent {}
