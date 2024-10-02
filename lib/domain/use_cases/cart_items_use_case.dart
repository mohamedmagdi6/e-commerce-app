import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/cart_items_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartItemsUseCase {
  CartItemsRepository cartItemRepository;
  CartItemsUseCase({required this.cartItemRepository});

  Future<Either<CartItemsEntity, Failures>> invoke() {
    return cartItemRepository.getCartItems();
  }
}
