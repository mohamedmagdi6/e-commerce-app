import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_product_to_wishlist_enttiy.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/wishlist_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteWishlistProductUseCase {
  WishlistTabRepository wishlistTabRepository;
  DeleteWishlistProductUseCase({required this.wishlistTabRepository});
  Future<Either<AddProductToWishlistEnttiy, Failures>> invoke(
      String productId) {
    return wishlistTabRepository.deleteWishlistProduct(productId);
  }
}
