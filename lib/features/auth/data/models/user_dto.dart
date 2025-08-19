import 'package:route_e_commerce_v2/features/auth/domain/entity/user.dart';

class UserDto {
  String? message;
  String? name;
  String? email;
  String? role;
  String? token;

  UserDto({this.message, this.name, this.email, this.role, this.token});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>?;

    return UserDto(
      message: json['message'] as String?,
      name: user?['name'] as String?,
      email: user?['email'] as String?,
      role: user?['role'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': {
        'name': name,
        'email': email,
        'role': role,
      },
      'token': token,
    };
  }

  User toEntity() {
    return User(
      name: name,
      email: email,
      role: role,
      token: token,);
  }
}
