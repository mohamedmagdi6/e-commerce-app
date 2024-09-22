import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(
      {required this.authRemoteDataSource}); // constractor injection.
  @override
  Future<Either<RegisterResponseEntity, Failures>> register(String name,
      String email, String phone, String password, String rePassword) async {
    var either = await authRemoteDataSource.registerData(
        name, email, password, rePassword, phone);
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<LoginResponseEntity, Failures>> login(
      String email, String password) async {
    // TODO: implement login
    var either = await authRemoteDataSource.loginData(email, password);
    return either.fold((response) => Left(response), (error) => Right(error));
  }
}
