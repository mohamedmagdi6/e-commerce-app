import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/cart_items_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCartItemsUseCase {
  CartItemsRepository cartItemsRepository;
  DeleteCartItemsUseCase({required this.cartItemsRepository});

  Future<Either<CartItemsEntity, Failures>> invoke(String productId) {
    return cartItemsRepository.deleteCartItems(productId);
  }
}
