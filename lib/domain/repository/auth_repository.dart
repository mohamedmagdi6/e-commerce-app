import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class AuthRepository {
  Future<Either<RegisterResponseEntity, Failures>> register(
    String name,
    String email,
    String phone,
    String password,
    String rePassword,
  );
  Future<Either<LoginResponseEntity, Failures>> login(
    String email,
    String password,
  );
}
