import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/use_cases/cart_items_use_case.dart';
import 'package:e_commerce_app/features/cart/screens/cart_screen_cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenStates> {
  CartItemsUseCase cartItemsUseCase;
  CartScreenViewModel({required this.cartItemsUseCase})
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
        emit(CartScreenFailureState(failures: error));
      },
    );
  }
}
