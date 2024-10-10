import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/wishlist_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishlistProductsUseCase {
  WishlistTabRepository wishlistTabRepository;
  GetWishlistProductsUseCase({required this.wishlistTabRepository});

  Future<Either<AllProductsResponseEntity, Failures>> invoke() {
    return wishlistTabRepository.getWishlistProduct();
  }
}
