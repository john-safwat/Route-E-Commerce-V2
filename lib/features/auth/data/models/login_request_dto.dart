class LoginRequestDto {
  LoginRequestDto({
      this.email, 
      this.password,});

  LoginRequestDto.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;
LoginRequestDto copyWith({  String? email,
  String? password,
}) => LoginRequestDto(  email: email ?? this.email,
  password: password ?? this.password,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}