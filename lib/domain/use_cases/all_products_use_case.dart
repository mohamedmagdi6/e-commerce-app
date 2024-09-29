import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/all_products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllProductsUseCase {
  AllProductsRepository allProdactsRepository;
  AllProductsUseCase({required this.allProdactsRepository});
  Future<Either<AllProductsResponseEntity, Failures>> invoke() {
    return allProdactsRepository.getAllProducts();
  }
}
