import 'package:chopper/chopper.dart';
import 'package:user_repository/src/models/models.dart';

part 'users_api_service.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class UsersApiService extends ChopperService {
  static UsersApiService create([ChopperClient? client]) => _$UsersApiService(client);

  @Get(headers: {'Accept': 'application/json', 'Content-Type': 'application/json'})
  Future<Response<List<User>>> getUsers();

  // @Post()
  // Future<Response> addUser(@Body() Map<String, dynamic> body);

  @Get(path: '/{user_id}')
  Future<Response<User>> getUser(@Path('user_id') String userId);

  // @Put(path: '/{user_id}')
  // @Patch(path: '/{user_id}')
  // Future<Response> updateUser(@Body() Map<String, dynamic> body, @Path('user_id') String userId);

  // @Delete(path: '/{user_id}')
  // Future<Response> deleteUser(@Path('user_id') String userId);
}
