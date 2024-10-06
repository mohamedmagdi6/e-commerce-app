import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/use_cases/cart_items_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/delete_cart_items_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_product_use_case.dart';
import 'package:e_commerce_app/features/cart/screens/cart_screen_cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenStates> {
  CartItemsUseCase cartItemsUseCase;
  DeleteCartItemsUseCase deleteCartItemsUseCase;
  UpdateProductUseCase updateProductUseCase;
  CartScreenViewModel(
      {required this.cartItemsUseCase,
      required this.deleteCartItemsUseCase,
      required this.updateProductUseCase})
      : super(CartScreenLoadingState());
  List<CartProductsEntity> products = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);
  void getCartProducts() async {
    emit(CartScreenLoadingState());
    Either<CartItemsEntity, Failures> either = await cartItemsUseCase.invoke();
    either.fold(
      (cartResponse) {
        products = cartResponse.cartDataEntity!.cartProductsEntity!;
        emit(CartScreenSuccessState(cartItemsEntity: cartResponse));
      },
      (error) {
        emit(CartScreenFailureState(failures: error.errorMessage));
      },
    );
  }

  void deleteCartItem(String productId) async {
    // emit(CartScreenLoadingState());
    Either<CartItemsEntity, Failures> either =
        await deleteCartItemsUseCase.invoke(productId);
    either.fold(
      (deleteRespons) {
        emit(CartScreenSuccessState(cartItemsEntity: deleteRespons));
        getCartProducts();
      },
      (error) {
        print(
            'error.errorMessage ================================= ${error.errorMessage}');
        emit(DeleteCartItemFailureState(failures: error.errorMessage));
      },
    );
  }

  void updateCartItem(String productId, int productCount) async {
    emit(UpdateCartItemLoadingState());
    var either = await updateProductUseCase.invoke(productCount, productId);
    either.fold(
      (response) {
        emit(CartScreenSuccessState(cartItemsEntity: response));
        getCartProducts();
      },
      (error) {
        emit(UpdateCartItemFailureState(failures: error.errorMessage));
      },
    );
  }
}
