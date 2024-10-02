import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class CartItemsRemoteDataSource {
  Future<Either<CartItemsEntity, Failures>> getCartItems();
}
