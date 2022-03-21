import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orange_gorest/user_list/models/models.dart';
import 'package:user_repository/user_repository.dart' as repository;

part 'user_list_event.dart';
part 'user_list_state.dart';
part 'user_list_bloc.freezed.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc({required this.userRepository}) : super(const Initial()) {
    on<Started>(_onStarted);
    on<Finished>(_onFinished);
    on<Error>(_onError);
  }

  final repository.UserRepository userRepository;

  FutureOr<void> _onStarted(Started event, Emitter<UserListState> emit) async {
    emit(const UserListState.loading());
    try {
      final List<repository.User> users = await userRepository.getUsers();
      emit(
        UserListState.loaded(
          users: users
              .map(
                (repository.User u) => User(
                  id: u.id,
                  name: u.name,
                  email: u.email,
                  gender: getGenderEnum(u.gender.name),
                  status: u.status,
                ),
              )
              .toList(),
        ),
      );
    } catch (_) {
      emit(const UserListState.error());
    }
  }

  FutureOr<void> _onFinished(Finished event, Emitter<UserListState> emit) {}

  FutureOr<void> _onError(Error event, Emitter<UserListState> emit) {
    emit(const UserListState.error());
  }
}
