import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_bloc/models/user_model.dart';

class UserApiProvider {
  Future<List<User>> getUser() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    
    if (response.statusCode == 200) {
      final List<dynamic> userJson = jsonDecode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList() ;
      
    } else {
      throw Exception('Failed');
    }
  }
}
