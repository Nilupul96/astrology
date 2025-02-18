import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String userId;
  final String? name;
  final DateTime? birthDay;
  final DateTime? birthTime;
  final String? gender;
  final bool? profileCompleted;

  const UserEntity(
      {required this.email,
      required this.userId,
      this.name,
      this.birthDay,
      this.gender,
      this.birthTime,
      this.profileCompleted});

  @override
  List<Object?> get props =>
      [email, userId, name, gender, birthDay, birthTime, profileCompleted];
}
