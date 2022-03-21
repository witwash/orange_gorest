import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum Gender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required Gender gender,
    @JsonKey(fromJson: User.getStatus) required bool status,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static bool getStatus(String status) {
    return status == 'active';
  }
}
