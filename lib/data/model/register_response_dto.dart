import 'package:e_commerce_app/domain/entities/register_response_entity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.message,
    super.token,
    super.user,
    super.statusMsg,
  });

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
  }
}

class UserDto extends RegisterUserEntity {
  String? role;

  UserDto({
    super.name,
    super.email,
    this.role,
  });
  UserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
