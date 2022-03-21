part of 'user_list_bloc.dart';

@freezed
class UserListEvent with _$UserListEvent {
  const factory UserListEvent.startLoading() = Started;
  const factory UserListEvent.loadingFinished() = Finished;
  const factory UserListEvent.error() = Error;
}
