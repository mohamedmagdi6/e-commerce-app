import 'package:e_commerce_app/domain/entities/add_product_to_wishlist_enttiy.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/add_product_to_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/add_products_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/all_products_use_case.dart';
import 'package:e_commerce_app/features/products_screen/presentation/screens/products_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsScreenViewModel extends Cubit<ProductsScreenStates> {
  AllProductsUseCase allProductsUseCase;
  AddProductsUseCase addProductsUseCase;
  AddProductToWishlistUseCase addProductToWishlistUseCase;
  ProductsScreenViewModel(
      {required this.allProductsUseCase,
      required this.addProductsUseCase,
      required this.addProductToWishlistUseCase})
      : super(ProductsScreenInitState());
  List<ProductDataEntity> products = [];
  List<dynamic> whisIds = [];
  int numOfProducts = 0;

  static ProductsScreenViewModel get(context) => BlocProvider.of(context);
  void getAllProduts() async {
    emit(ProductsScreenLoadingState());
    var either = await allProductsUseCase.invoke();
    either.fold(
      (response) {
        products = response.data!;
        emit(ProductsScreenSuccessState(responseEntity: response));
      },
      (error) {
        emit(ProductsScreenFailureState(failures: error));
      },
    );
  }

  void addProduct(String productId) async {
    emit(AddProductToCartLoadingState());
    var eihter = await addProductsUseCase.invoke(productId);
    eihter.fold(
      (response) {
        numOfProducts = response.numOfCartItems!;
        emit(AddProductToCartSuccessState(addProductsToCartEntity: response));
      },
      (error) {
        emit(AddProductToCartFailureState(failures: error));
      },
    );
  }

  void addProductToWishlist(String productId) async {
    emit(AddProductToWishlistLoadingState());
    var either = await addProductToWishlistUseCase.invoke(productId);
    either.fold(
      (response) {
        whisIds = response.data!;
        emit(AddProductToWishlistSuccessState(
            addProductToWishlistEnttiy: response));
      },
      (error) {
        emit(AddProductToWishlistFailureState(failures: error));
      },
    );
  }
}
