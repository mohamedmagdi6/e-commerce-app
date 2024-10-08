import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_product_to_wishlist_enttiy.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/products_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductToWishlistUseCase {
  ProductsTabRepository productsTabRepository;
  AddProductToWishlistUseCase({required this.productsTabRepository});
  Future<Either<AddProductToWishlistEnttiy, Failures>> invoke(
      String productId) {
    return productsTabRepository.addProductToWishlist(productId);
  }
}
