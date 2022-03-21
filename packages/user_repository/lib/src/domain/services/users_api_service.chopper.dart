// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$UsersApiService extends UsersApiService {
  _$UsersApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UsersApiService;

  @override
  Future<Response<List<User>>> getUsers() {
    final $url = '/users';
    final $headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<User>, User>($request);
  }
}
