import 'package:chopper/chopper.dart';
import 'package:user_repository/src/domain/convertors/json_serializable_converter.dart';
import 'package:user_repository/src/domain/services/users_api_service.dart';
import 'package:user_repository/src/models/models.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static ChopperClient create(List<ChopperService> services, [http.BaseClient? httpClient]) => ChopperClient(
        client: httpClient,
        baseUrl: 'https://gorest.co.in/public/v2/',
        services: services,
        converter: JsonSerializableConverter(),
      );

  final ChopperClient _chopperClient;

  UserRepository({
    ChopperClient? chopperClient,
  }) : _chopperClient = chopperClient ?? UserRepository.create([UsersApiService.create()]);

  Future<List<User>> getUsers() async {
    final Response<List<User>> result = await _chopperClient.getService<UsersApiService>().getUsers();
    final users = result.body;
    if (users != null) {
      return users;
    } else {
      throw Exception('lalala llolo');
    }
  }
}
