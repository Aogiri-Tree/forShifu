import 'package:bloc/bloc.dart';
import 'package:learn_bloc/models/user_model.dart';
import 'package:learn_bloc/services/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserLoadedEvent>(_onUserLoadingEvent);
    on<UserClearEvent>(_onUserClearEvent);
  }
}



void _onUserLoadingEvent(UserEvent event, Emitter<UserState> emit) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    if (prefs.getInt('id') == null && prefs.getString('name') == null && prefs.getString('email') == null && prefs.getString('phone') == null ) {
      emit(UserInitial());
    } else {
      final loadedUsers = await UserRepository().getAllUsers();
      emit(UserLoadedState(user: loadedUsers));
    }
  } catch (e) {
    emit(UserErrorState(error: e));

    emit(UserInitial());
  }
}

void _onUserClearEvent(UserEvent event, Emitter<UserState> emit) async {
  emit(UserInitial());
  // emit(SnackbarErrorAppear());
  // await Future.delayed(const Duration(seconds: 2));
}
