import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/products_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductsUseCase {
  ProductsTabRepository productsTabRepository;
  AddProductsUseCase({required this.productsTabRepository});
  Future<Either<AddProductsToCartEntity, Failures>> invoke(String productId) {
    return productsTabRepository.addProduct(productId);
  }
}
