import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_bloc/bloc/user_bloc.dart';
import 'package:learn_bloc/pages/my_page.dart';
import 'package:learn_bloc/services/user_repository.dart';

void main() {
  runApp(const MyApp());
}

final userRepository = UserRepository();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(),
      child: const MaterialApp(
        home: MyPage(),
      ),
    );
  }
}
