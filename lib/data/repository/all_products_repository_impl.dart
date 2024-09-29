import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/all_products_rmote_data_source/all_products_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repository/all_products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AllProductsRepository)
class AllProductsRepositoryImpl implements AllProductsRepository {
  AllProductsRemoteDataSource allProductsRemoteDataSource;
  AllProductsRepositoryImpl({required this.allProductsRemoteDataSource});
  @override
  Future<Either<AllProductsResponseEntity, Failures>> getAllProducts() async {
    var either = await allProductsRemoteDataSource.getAllProducts();
    return either.fold(
      (response) => Left(response),
      (error) => Right(error),
    );
  }
}
