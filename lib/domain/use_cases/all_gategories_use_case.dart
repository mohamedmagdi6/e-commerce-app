import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllCategoriesUseCase {
  HomeTabRepository homeTabRepository;
  AllCategoriesUseCase({required this.homeTabRepository});
  Future<Either<CategoriesOrBrandsResponseEntity, Failures>> invoke() {
    return homeTabRepository.getAllCategories();
  }
}
