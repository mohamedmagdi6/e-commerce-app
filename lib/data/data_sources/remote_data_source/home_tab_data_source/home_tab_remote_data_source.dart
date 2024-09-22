import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class HomeTabRemoteDataSource {
  Future<Either<CategoriesOrBrandsResponseEntity, Failures>> getAllCategories();
  Future<Either<CategoriesOrBrandsResponseEntity, Failures>> getBrands();
}
