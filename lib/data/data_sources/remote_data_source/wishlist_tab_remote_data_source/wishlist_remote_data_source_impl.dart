import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/shared_prefrence_utils.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/wishlist_tab_remote_data_source/wishlist_tab_remote_data_source.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/add_product_to_wishlist_dto.dart';
import 'package:e_commerce_app/data/model/all_products_rsponse_dto.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistTabRemoteDataSource)
class WishlistRemoteDataSourceImpl extends WishlistTabRemoteDataSource {
  ApiManager apiManager;
  WishlistRemoteDataSourceImpl({required this.apiManager});

  var token = SharedPrefrenceUtils.getData(key: 'token');
  @override
  Future<Either<AllProductsResponseDto, Failures>> getWishlistProducts() async {
    var response =
        await apiManager.getData(EndPoints.wishList, headers: {'token': token});
    AllProductsResponseDto wishlistData =
        AllProductsResponseDto.fromJson(response.data);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Left(wishlistData);
    } else {
      return Right(Failures(errorMessage: wishlistData.message!));
    }
  }

  @override
  Future<Either<AddProductToWishlistDto, Failures>> deleteWishlistProducts(
      String productId) async {
    var response = await apiManager.deleteData(
        '${EndPoints.wishList}/$productId',
        headers: {'token': token});
    AddProductToWishlistDto deleteResponse =
        AddProductToWishlistDto.fromJson(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Left(deleteResponse);
    } else {
      return Right(Failures(errorMessage: deleteResponse.message!));
    }
  }
}
