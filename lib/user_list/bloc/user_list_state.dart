part of 'user_list_bloc.dart';

@freezed
class UserListState with _$UserListState {
  const factory UserListState.initial() = Initial;
  const factory UserListState.loading() = Loading;
  const factory UserListState.loaded({required List<User> users}) = Loaded;
  const factory UserListState.error() = FinishedWithError;
}
