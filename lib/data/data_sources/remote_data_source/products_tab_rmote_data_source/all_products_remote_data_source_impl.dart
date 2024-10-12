import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/shared_prefrence_utils.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/products_tab_rmote_data_source/all_products_remote_data_source.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/add_product_to_wishlist_dto.dart';
import 'package:e_commerce_app/data/model/add_products_cart_dto.dart';
import 'package:e_commerce_app/data/model/all_products_rsponse_dto.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsTabRemoteDataSource)
class AllProductsRemoteDataSourceImpl implements ProductsTabRemoteDataSource {
  ApiManager apiManager;
  AllProductsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<AllProductsResponseDto, Failures>> getAllProducts() async {
    var response = await apiManager.getData(EndPoints.allProducts);
    var allProductsResponse = AllProductsResponseDto.fromJson(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Left(allProductsResponse);
    } else {
      return Right(Failures(errorMessage: allProductsResponse.message!));
    }
  }

  var token = SharedPrefrenceUtils.getData(key: 'token');

  @override
  Future<Either<AddProductToWishlistDto, Failures>> addProductToWishlist(
      String productId) async {
    var response = await apiManager.postData(EndPoints.wishList,
        body: {'productId': productId}, headers: {'token': token});
    AddProductToWishlistDto wishRsponse =
        AddProductToWishlistDto.fromJson(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Left(wishRsponse);
    } else {
      return Right(Failures(errorMessage: wishRsponse.message!));
    }
  }
}
