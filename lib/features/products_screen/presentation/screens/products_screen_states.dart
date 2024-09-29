import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

class ProductsScreenStates {}

class ProductsScreenLoadingState extends ProductsScreenStates {}

class ProductsScreenFailureState extends ProductsScreenStates {
  Failures failures;
  ProductsScreenFailureState({required this.failures});
}

class ProductsScreenSuccessState extends ProductsScreenStates {
  AllProductsResponseEntity responseEntity;
  ProductsScreenSuccessState({required this.responseEntity});
}
