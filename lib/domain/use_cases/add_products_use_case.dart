import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/cart_items_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductsUseCase {
  CartItemsRepository cartItemsRepository;
  AddProductsUseCase({required this.cartItemsRepository});
  Future<Either<AddProductsToCartEntity, Failures>> invoke(String productId) {
    return cartItemsRepository.addProductToCart(productId);
  }
}
