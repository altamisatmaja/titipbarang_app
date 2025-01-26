import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:titipbarang_app/utils/helper/parsing_helper.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
class User with _$User {
  factory User({
    @JsonKey(fromJson: ParsingHelper.parseInt) int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
