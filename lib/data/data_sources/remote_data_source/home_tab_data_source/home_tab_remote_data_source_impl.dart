import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/home_tab_data_source/home_tab_remote_data_source.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/categories_or_brands_response_dto.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  ApiManager apiManager;
  HomeTabRemoteDataSourceImpl({required this.apiManager});
  Future<Either<CategoriesOrBrandsResponseDto, Failures>>
      getAllCategories() async {
    var response = await apiManager.getData(EndPoints.allCategories);
    var ctegoriesResponse =
        CategoriesOrBrandsResponseDto.fromJson(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Left(ctegoriesResponse);
    } else {
      return Right(ServerFailure(errorMessage: ctegoriesResponse.message!));
    }
  }
}
