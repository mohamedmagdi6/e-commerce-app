import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/cart_items_data_source/cart_items_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/cart_items_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartItemsRepository)
class CartItemsRepositoryImpl implements CartItemsRepository {
  CartItemsRemoteDataSource cartItemsRemoteDataSource;
  CartItemsRepositoryImpl({required this.cartItemsRemoteDataSource});
  @override
  Future<Either<CartItemsEntity, Failures>> getCartItems() async {
    var either = await cartItemsRemoteDataSource.getCartItems();
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<CartItemsEntity, Failures>> deleteCartItems(
      String productId) async {
    var either = await cartItemsRemoteDataSource.deleteCartItems(productId);

    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<CartItemsEntity, Failures>> updateCartItems(
      int productCount, String productId) async {
    var either = await cartItemsRemoteDataSource.updateCartItems(
        productCount, productId);
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<AddProductsToCartEntity, Failures>> addProductToCart(
      String productId) async {
    var either = await cartItemsRemoteDataSource.addProductToCart(productId);
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }
}
