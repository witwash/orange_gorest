import 'dart:convert' as JSON;

import 'package:chopper/chopper.dart';
import 'package:user_repository/src/models/models.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    final jsonRaw = super.convertResponse<dynamic, dynamic>(response);
    if (jsonRaw.body == null || jsonRaw.body is String && (jsonRaw.body as String).isEmpty) {
      return jsonRaw.copyWith(body: null);
    }

    final dynamic body = JSON.jsonDecode(jsonRaw.bodyString);
    final dynamic decodedItem = _decode<Item>(body);
    return jsonRaw.copyWith<ResultType>(body: decodedItem as ResultType);
  }

  @override
  Response convertError<BodyType, InnerType>(Response response) {
    final jsonRaw = super.convertError(response);
    final dynamic body = jsonRaw.body;
    final dynamic responseError = _decode<ResponseError>(body);
    return jsonRaw.copyWith<BodyType>(bodyError: responseError as BodyType);
  }
}

const Map<Type, JsonFactory> factories = {User: User.fromJson};

dynamic _decode<T>(dynamic entity) {
  if (entity is Iterable) return _decodeList<T>(entity);

  if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);

  return entity;
}

T _decodeMap<T>(Map<String, dynamic> values) {
  final jsonFactory = factories[T];
  if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
    //todo add custom exception
    throw Exception(T.toString());
  }
  return jsonFactory(values);
}

List<T> _decodeList<T>(Iterable elements) =>
    elements.where((dynamic element) => element != null).map((dynamic e) => _decode<T>(e) as T).toList();
