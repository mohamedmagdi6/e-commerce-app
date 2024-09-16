import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/register_response_dto.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl(
      {required this.apiManager}); // constractor injection.
  @override
  Future<Either<RegisterResponseDto, Failures>> registerData(String name,
      String email, String password, String rePassword, String phone) async {
    var checkResult = await Connectivity().checkConnectivity();
    // if (checkResult == ConnectivityResult.wifi ||
    //     checkResult == ConnectivityResult.mobile) {
    var response = await apiManager.postData(EndPoints.signUp, body: {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone
    });
    var registerResponse = RegisterResponseDto.fromJson(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return left(registerResponse);
    } else if (response.statusCode == 409) {
      return right(ServerFailure(errorMessage: registerResponse.message!));
    } else {
      return right(ServerFailure(errorMessage: registerResponse.message!));
    }
    // } else {
    //   return right(NetworkFailure(
    //       errorMessage: 'Please check your network connection '));
    // }
  }
}
