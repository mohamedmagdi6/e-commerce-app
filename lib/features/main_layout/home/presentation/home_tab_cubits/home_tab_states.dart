import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

class HomeTabStates {}

class HomeTabInitState extends HomeTabStates {}

class AllCategoriesLoadingState extends HomeTabStates {}

class AllCategoriesFailureState extends HomeTabStates {
  Failures failures;
  AllCategoriesFailureState({required this.failures});
}

class AllCategoriesSuccessState extends HomeTabStates {
  CategoriesOrBrandsResponseEntity categoriesResponseEntity;
  AllCategoriesSuccessState({required this.categoriesResponseEntity});
}

class BrandsLoadingState extends HomeTabStates {}

class BrandsFailureState extends HomeTabStates {
  Failures failures;
  BrandsFailureState({required this.failures});
}

class BrandsSuccessState extends HomeTabStates {
  CategoriesOrBrandsResponseEntity brandsResponseEntity;
  BrandsSuccessState({required this.brandsResponseEntity});
}
