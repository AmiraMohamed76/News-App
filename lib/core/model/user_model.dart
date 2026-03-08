import 'package:hive_ce_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String userName;

  @HiveField(1)
  final String userEmail;

  @HiveField(2)
  final String userPassword;

  @HiveField(3)
  String? countryName;

  @HiveField(4)
  String? countryCode;

  UserModel({
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    this.countryName,
    this.countryCode,
  });

  UserModel copyWith({
    String? userName,
    String? userEmail,
    String? userPassword,
    String? countryName,
    String? countryCode,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      userEmail: userEmail ??this.userEmail,
      userPassword: userPassword ??this.userPassword,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
