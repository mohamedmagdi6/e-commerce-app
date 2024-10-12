import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class CartItemsRepository {
  Future<Either<CartItemsEntity, Failures>> getCartItems();
  Future<Either<CartItemsEntity, Failures>> deleteCartItems(String productId);
  Future<Either<CartItemsEntity, Failures>> updateCartItems(
      int productCount, String productId);
  Future<Either<AddProductsToCartEntity, Failures>> addProductToCart(
      String productId);
}
