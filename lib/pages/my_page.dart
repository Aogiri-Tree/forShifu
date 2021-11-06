import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/user_bloc.dart';
import 'package:learn_bloc/pages/user_list.dart';
import 'package:learn_bloc/widgets/action_buttons.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        centerTitle: true,
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Success'),
              action: SnackBarAction(
                onPressed: () {
                  return; 
                },
                label: 'Undo',
              ),
            ));
          } else if (state is UserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Error'),
              action: SnackBarAction(
                onPressed: () {
                  return;
                },
                label: 'Undo',
              ),
            ));
          }
        },
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ActionButtons(),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}
