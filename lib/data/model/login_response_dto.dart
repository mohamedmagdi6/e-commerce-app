import 'package:e_commerce_app/domain/entities/login_response_entity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.message,
    super.token,
    super.user,
    super.statusMsg,
  });

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDto.fromJson(json['user']) : null;
  }
}

class LoginUserDto extends LoginUserEntity {
  String? role;

  LoginUserDto({
    super.name,
    super.email,
    this.role,
  });
  LoginUserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
