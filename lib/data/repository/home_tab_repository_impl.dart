import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/home_tab_data_source/home_tab_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl implements HomeTabRepository {
  HomeTabRemoteDataSource homeTabRemoteDataSource;
  HomeTabRepositoryImpl({required this.homeTabRemoteDataSource});
  @override
  Future<Either<CategoriesOrBrandsResponseEntity, Failures>>
      getAllCategories() async {
    var either = await homeTabRemoteDataSource.getAllCategories();
    return either.fold((response) => Left(response), (error) => Right(error));
  }
}
