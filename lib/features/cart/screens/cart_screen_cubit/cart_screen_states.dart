import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class CartScreenStates {}

class CartScreenLoadingState extends CartScreenStates {}

class CartScreenFailureState extends CartScreenStates {
  Failures failures;
  CartScreenFailureState({required this.failures});
}

class CartScreenSuccessState extends CartScreenStates {
  CartItemsEntity cartItemsEntity;
  CartScreenSuccessState({required this.cartItemsEntity});
}
