import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/wishlist_tab_remote_data_source/wishlist_tab_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/wishlist_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistTabRepository)
class WishlistTabRepositoryImpl extends WishlistTabRepository {
  WishlistTabRemoteDataSource wishlistTabRemoteDataSource;
  WishlistTabRepositoryImpl({required this.wishlistTabRemoteDataSource});
  @override
  Future<Either<AllProductsResponseEntity, Failures>>
      getWishlistProduct() async {
    var either = await wishlistTabRemoteDataSource.getWishlistProducts();
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }
}
