import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_gorest/user_list/view/user_list_page.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: MaterialApp(
        title: 'Orange User',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const UserListPage(),
      ),
    );
  }
}
