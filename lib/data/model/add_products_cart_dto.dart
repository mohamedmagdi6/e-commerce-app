import 'package:e_commerce_app/domain/entities/add_products_to_cart_entity.dart';

class AddProductsToCartDto extends AddProductsToCartEntity {
  AddProductsToCartDto(
      {super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data});

  AddProductsToCartDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data =
        json['data'] != null ? AddProductDataDto.fromJson(json['data']) : null;
  }
}

class AddProductDataDto extends AddProductDataEntity {
  String? cartOwner;

  String? createdAt;
  String? updatedAt;
  int? iV;

  AddProductDataDto(
      {super.sId,
      this.cartOwner,
      super.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      super.totalCartPrice});

  AddProductDataDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <AddedProductDto>[];
      json['products'].forEach((v) {
        products!.add(new AddedProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddedProductDto extends AddedProductEntity {
  AddedProductDto({super.count, super.sId, super.product, super.price});

  AddedProductDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
