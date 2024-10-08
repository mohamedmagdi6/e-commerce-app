import 'package:e_commerce_app/domain/entities/add_product_to_wishlist_enttiy.dart';

class AddProductToWishlistDto extends AddProductToWishlistEnttiy {
  AddProductToWishlistDto({super.data, super.message, super.status});
  AddProductToWishlistDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
}
