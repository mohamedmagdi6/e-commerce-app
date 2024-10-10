import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class FavouriteScreenStates {}

class FavouriteScreenLoadingState extends FavouriteScreenStates {}

class FavouriteScreenSuccessState extends FavouriteScreenStates {
  AllProductsResponseEntity allProductsResponseEntity;
  FavouriteScreenSuccessState({required this.allProductsResponseEntity});
}

class FavouriteScreenFailureState extends FavouriteScreenStates {
  Failures failures;
  FavouriteScreenFailureState({required this.failures});
}
