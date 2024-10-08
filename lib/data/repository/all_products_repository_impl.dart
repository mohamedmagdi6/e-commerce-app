import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/products_tab_rmote_data_source/all_products_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/add_product_to_wishlist_enttiy.dart';
import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/products_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsTabRepository)
class AllProductsRepositoryImpl implements ProductsTabRepository {
  ProductsTabRemoteDataSource productsTabRemoteDataSource;
  AllProductsRepositoryImpl({required this.productsTabRemoteDataSource});
  @override
  Future<Either<AllProductsResponseEntity, Failures>> getAllProducts() async {
    var either = await productsTabRemoteDataSource.getAllProducts();
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<AddProductsToCartEntity, Failures>> addProduct(
      String productId) async {
    var either = await productsTabRemoteDataSource.addProduct(productId);
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<AddProductToWishlistEnttiy, Failures>> addProductToWishlist(
      String productId) async {
    var either =
        await productsTabRemoteDataSource.addProductToWishlist(productId);
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }
}
