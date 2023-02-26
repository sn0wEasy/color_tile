import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required String id,
    required String password,
    String? displayName,
  }) = _UserState;
}
