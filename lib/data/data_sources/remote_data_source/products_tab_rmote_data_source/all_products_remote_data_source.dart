import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class ProductsTabRemoteDataSource {
  Future<Either<AllProductsResponseEntity, Failures>> getAllProducts();
  Future<Either<AddProductsToCartEntity, Failures>> addProduct(
      String productId);
}
