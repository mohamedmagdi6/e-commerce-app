import 'package:e_commerce_app/domain/entities/add_product_to_wishlist_enttiy.dart';
import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';
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

class DeleteLoadingState extends FavouriteScreenStates {}

class DeleteSuccessState extends FavouriteScreenStates {
  AddProductToWishlistEnttiy addProductDataEntity;
  DeleteSuccessState({required this.addProductDataEntity});
}

class DeleteFailureState extends FavouriteScreenStates {
  Failures failures;
  DeleteFailureState({required this.failures});
}
