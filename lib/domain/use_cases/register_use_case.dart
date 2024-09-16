import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository}); // constractor injection.

  Future<Either<RegisterResponseEntity, Failures>> invoke(
    String name,
    String email,
    String phone,
    String password,
    String rePassword,
  ) {
    return authRepository.register(name, email, phone, password, rePassword);
  }
}
