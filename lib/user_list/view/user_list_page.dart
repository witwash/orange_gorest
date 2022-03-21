import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_gorest/user_list/bloc/user_list_bloc.dart';
import 'package:orange_gorest/user_list/view/user_list_view.dart';
import 'package:user_repository/user_repository.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListBloc(userRepository: context.read<UserRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orange User List'),
        ),
        body: const UserListView(),
      ),
    );
  }
}
