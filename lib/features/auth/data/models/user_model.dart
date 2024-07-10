import '../../domain/entities/user.dart';

class UserData extends UserEntity {
  const UserData(
      {required super.email,
      required super.userId,
      super.name,
      super.birthDay,
      super.gender,
      super.profileCompleted});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        email: json['email'],
        userId: json['userId'],
        name: json['name'],
        gender: 'gender',
        birthDay: json['birthday'],
        profileCompleted: json['profileCompleted']);
  }
}
