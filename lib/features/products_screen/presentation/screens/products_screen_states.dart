import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

class ProductsScreenStates {}

class ProductsScreenInitState extends ProductsScreenStates {}

class ProductsScreenLoadingState extends ProductsScreenStates {}

class ProductsScreenFailureState extends ProductsScreenStates {
  Failures failures;
  ProductsScreenFailureState({required this.failures});
}

class ProductsScreenSuccessState extends ProductsScreenStates {
  AllProductsResponseEntity responseEntity;
  ProductsScreenSuccessState({required this.responseEntity});
}

class AddProductToCartLoadingState extends ProductsScreenStates {}

class AddProductToCartFailureState extends ProductsScreenStates {
  Failures failures;
  AddProductToCartFailureState({required this.failures});
}

class AddProductToCartSuccessState extends ProductsScreenStates {
  AddProductsToCartEntity addProductsToCartEntity;
  AddProductToCartSuccessState({required this.addProductsToCartEntity});
}
