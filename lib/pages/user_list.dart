import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/user_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserInitial) {
          return const Center(
            child: Text('No load data. Press button load'),
          );
        }
        if (state is UserErrorState) {
          return const Center(
            child: Text('Failed'),
          );
        }
        if (state is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState) {
          return ListView.builder(
              itemCount: state.user.length,
              itemBuilder: (context, index) {
                if (state.user.isNotEmpty) {
                  return ListTile(
                    leading: Text(
                      'ID : ${state.user[index].id}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Column(
                      children: [
                        Text(
                          'My name: ${state.user[index].name}',
                        ),
                        Text('Email: ${state.user[index].email}'),
                        Text('Phone: ${state.user[index].phone}'),
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              });
        }
        return const Text('Data no loaded');
      }),
    );
  }
}
