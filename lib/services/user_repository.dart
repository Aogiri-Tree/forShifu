import 'package:learn_bloc/models/user_model.dart';
import 'package:learn_bloc/services/user_api_provider.dart';

class UserRepository {
  final _usersProvider = UserApiProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
