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
        return _ListItem(userHolder: _ListItemHolder(userData: users[index]));
      },
      itemCount: users.length,
    );
  }
}

class _ListItemHolder {
  _ListItemHolder({
    required this.userData,
  }) : selected = false;

  bool selected;
  final User userData;
}

class _ListItem extends StatefulWidget {
  const _ListItem({
    Key? key,
    required this.userHolder,
  }) : super(key: key);

  final _ListItemHolder userHolder;

  @override
  State<_ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text('User: ${widget.userHolder.userData.name}'),
        subtitle: Text('Details:  ${widget.userHolder.userData.email}'),
        selected: widget.userHolder.selected,
        selectedTileColor: Colors.grey,
        onTap: () {
          context.read<UserListBloc>().add(UserListEvent.getUser(userId: widget.userHolder.userData.id));
        },
        onLongPress: () {
          setState(() {
            widget.userHolder.selected = !widget.userHolder.selected;
          });
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
