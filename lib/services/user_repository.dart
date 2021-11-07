import 'package:learn_bloc/models/user_model.dart';
import 'package:learn_bloc/services/user_api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final _usersProvider = UserApiProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();

  
  Future<void> saveData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final loadData =await UserRepository().getAllUsers();
  final int index = loadData.length -1;
  prefs.setInt('id', loadData[index].id );
  prefs.setString('name', loadData[index].name);
  prefs.setString('email', loadData[index].email);
  prefs.setString('phone', loadData[index].phone);
  prefs.getInt('id');
  prefs.getString('name');
  prefs.getString('email');
  prefs.getString('phone');
  }

}
