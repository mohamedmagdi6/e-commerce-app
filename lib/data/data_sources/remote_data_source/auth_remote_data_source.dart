import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<RegisterResponseEntity, Failures>> registerData(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
