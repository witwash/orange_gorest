import 'package:chopper/chopper.dart';

class GorestRepository {
  final ChopperClient _client;
  GorestRepository({
    ChopperClient? client,
  }) : _client = client ?? ChopperClient();
}
