class AuthResponseDto {
  AuthResponseDto({
      this.message, 
      this.user, 
      this.token,});

  AuthResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  String? message;
  String? statusMsg;
  User? user;
  String? token;
AuthResponseDto copyWith({  String? message,
  User? user,
  String? token,
}) => AuthResponseDto(  message: message ?? this.message,
  user: user ?? this.user,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;
User copyWith({  String? name,
  String? email,
  String? role,
}) => User(  name: name ?? this.name,
  email: email ?? this.email,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}