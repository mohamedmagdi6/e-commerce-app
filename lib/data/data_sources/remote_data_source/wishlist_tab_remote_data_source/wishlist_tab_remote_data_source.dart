import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class WishlistTabRemoteDataSource {
  Future<Either<AllProductsResponseEntity, Failures>> getWishlistProducts();
}
