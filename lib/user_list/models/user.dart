import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum Gender {
  male,
  female,
  omitted,
}

Gender getGenderEnum(dynamic genderValue) => Gender.values.firstWhere((e) => describeEnum(e) == genderValue);

@freezed
class User with _$User {
  const factory User(
      {required int id,
      required String name,
      required String email,
      required Gender gender,
      required bool status}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
