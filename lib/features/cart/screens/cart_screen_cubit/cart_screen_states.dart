import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';

class CartScreenStates {}

class CartScreenLoadingState extends CartScreenStates {}

class CartScreenFailureState extends CartScreenStates {
  String failures;
  CartScreenFailureState({required this.failures});
}

class CartScreenSuccessState extends CartScreenStates {
  CartItemsEntity cartItemsEntity;
  CartScreenSuccessState({required this.cartItemsEntity});
}

class DeleteCartItemLoadingState extends CartScreenStates {}

class DeleteCartItemFailureState extends CartScreenStates {
  String failures;
  DeleteCartItemFailureState({required this.failures});
}

class DeleteCartItemSuccessState extends CartScreenStates {
  CartItemsEntity cartItemsEntity;
  DeleteCartItemSuccessState({required this.cartItemsEntity});
}

class UpdateCartItemLoadingState extends CartScreenStates {}

class UpdateCartItemFailureState extends CartScreenStates {
  String failures;
  UpdateCartItemFailureState({required this.failures});
}

class UpdateCartItemSuccessState extends CartScreenStates {
  CartItemsEntity cartItemsEntity;
  UpdateCartItemSuccessState({required this.cartItemsEntity});
}
