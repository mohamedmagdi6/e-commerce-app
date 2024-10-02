import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/shared_prefrence_utils.dart';
import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/cart_items_data_source/cart_items_remote_data_source.dart';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/cart_items_dto.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartItemsRemoteDataSource)
class CartItemsRemoteDataSourceImpl implements CartItemsRemoteDataSource {
  ApiManager apiManager;
  CartItemsRemoteDataSourceImpl({required this.apiManager});

  var token = SharedPrefrenceUtils.getData(key: 'token');
  @override
  Future<Either<CartItemsDto, Failures>> getCartItems() async {
    var response = await apiManager
        .getData(EndPoints.addProduct, headers: {'token': token});
    CartItemsDto cartItemsResponse = CartItemsDto.fromJson(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Left(cartItemsResponse);
    } else {
      return Right(Failures(errorMessage: cartItemsResponse.message!));
    }
  }
}
