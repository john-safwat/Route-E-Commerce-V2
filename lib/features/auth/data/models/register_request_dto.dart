class RegisterRequestDto {
  RegisterRequestDto({
      this.name, 
      this.email, 
      this.password, 
      this.rePassword,});

  RegisterRequestDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
  }
  String? name;
  String? email;
  String? password;
  String? rePassword;
RegisterRequestDto copyWith({  String? name,
  String? email,
  String? password,
  String? rePassword,
}) => RegisterRequestDto(  name: name ?? this.name,
  email: email ?? this.email,
  password: password ?? this.password,
  rePassword: rePassword ?? this.rePassword,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    return map;
  }

}