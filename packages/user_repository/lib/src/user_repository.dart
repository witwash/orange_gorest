import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:user_repository/env.dart' as env;
import 'package:user_repository/src/domain/convertors/json_serializable_converter.dart';
import 'package:user_repository/src/domain/services/users_api_service.dart';
import 'package:user_repository/src/models/models.dart';

class UserRepository {
  static ChopperClient create(List<ChopperService> services, [http.BaseClient? httpClient]) => ChopperClient(
        client: httpClient,
        baseUrl: 'https://gorest.co.in/public/v2',
        services: services,
        converter: JsonSerializableConverter(),
        interceptors: [
          const HeadersInterceptor({
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${env.apiKey}',
          })
        ],
      );

  final ChopperClient _chopperClient;

  UserRepository({
    ChopperClient? chopperClient,
  }) : _chopperClient = chopperClient ?? UserRepository.create([UsersApiService.create()]);

  Future<List<User>?> getUsers() async {
    try {
      final Response<List<User>> result = await _chopperClient.getService<UsersApiService>().getUsers();
      final List<User>? users = result.body;
      return users;
    } catch (e) {
      throw Exception();
    }
  }

  Future<User?> getUser(int id) async {
    try {
      final Response<User> result = await _chopperClient.getService<UsersApiService>().getUser(id.toString());
      final User? user = result.body;
      return user;
    } catch (_) {
      throw Exception('Error while getting user');
    }
  }
}
