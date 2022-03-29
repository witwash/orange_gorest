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
      create: (context) => UserListBloc(userRepository: context.read<UserRepository>())
        ..add(
          const UserListEvent.startLoading(),
        ),
      child: const UserListPageWidget(),
    );
  }
}

class UserListPageWidget extends StatelessWidget {
  const UserListPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orange User List'),
      ),
      body: const UserListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<UserListBloc>().add(const UserListEvent.getUser(userId: 3806));
        },
      ),
    );
  }
}
