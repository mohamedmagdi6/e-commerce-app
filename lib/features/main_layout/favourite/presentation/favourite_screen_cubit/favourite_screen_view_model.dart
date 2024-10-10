import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/delete_wishlist_product_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_wishlist_products_use_case.dart';
import 'package:e_commerce_app/features/main_layout/favourite/presentation/favourite_screen_cubit/favourite_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavouriteScreenViewModel extends Cubit<FavouriteScreenStates> {
  FavouriteScreenViewModel(
      {required this.wishlistProductsUseCase,
      required this.deleteWishlistProductUseCase})
      : super(FavouriteScreenLoadingState());
  GetWishlistProductsUseCase wishlistProductsUseCase;
  DeleteWishlistProductUseCase deleteWishlistProductUseCase;
  List<ProductDataEntity> products = [];

  static FavouriteScreenViewModel get(context) => BlocProvider.of(context);

  void getWishlistProducts() async {
    emit(FavouriteScreenLoadingState());
    var either = await wishlistProductsUseCase.invoke();
    either.fold(
      (responseData) {
        products = responseData.data!;
        emit(FavouriteScreenSuccessState(
            allProductsResponseEntity: responseData));
      },
      (failure) {
        emit(FavouriteScreenFailureState(failures: failure));
      },
    );
  }

  void deleteWishlistProduct(String productId) async {
    emit(DeleteLoadingState());
    var either = await deleteWishlistProductUseCase.invoke(productId);
    either.fold(
      (response) {
        emit(DeleteSuccessState(addProductDataEntity: response));
        getWishlistProducts();
      },
      (error) {
        emit(DeleteFailureState(failures: error));
      },
    );
  }
}
