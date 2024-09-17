import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<LoginResponseEntity, Failures>> invoke(
    String email,
    String password,
  ) {
    return authRepository.login(email, password);
  }
}
