import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_gorest/user_list/bloc/user_list_bloc.dart';
import 'package:orange_gorest/user_list/models/models.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Text('Hello there'),
          ),
          loading: () => const _LoadingWidget(),
          loaded: (users) => _LoadedWidget(
            users: users,
          ),
          error: () => const _ErrorWidget(),
        );
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Error while loading'));
  }
}

class _LoadedWidget extends StatelessWidget {
  const _LoadedWidget({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _ListItem(user: users[index]);
      },
      itemCount: users.length,
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text('User: ${user.name}'),
        subtitle: Text('Details:  ${user.email}'),
        tileColor: user.status ? Colors.white : Colors.grey,
        onTap: () {
          context.read<UserListBloc>().add(UserListEvent.getUser(userId: user.id));
        },
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ),
          Text('Loading...'),
        ],
      ),
    );
  }
}
