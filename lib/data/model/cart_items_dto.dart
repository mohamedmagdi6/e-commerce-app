import 'package:e_commerce_app/domain/entities/cart_items_entity.dart';

class CartItemsDto extends CartItemsEntity {
  String? status;
  String? message;
  String? cartId;

  CartItemsDto(
      {this.status,
      super.numOfCartItems,
      this.cartId,
      super.cartDataEntity,
      this.message});

  CartItemsDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    cartDataEntity =
        json['data'] != null ? CartDataDto.fromJson(json['data']) : null;
  }
}

class CartDataDto extends CartDataEntity {
  String? sId;
  String? cartOwner;
  String? createdAt;
  String? updatedAt;

  CartDataDto(
      {this.sId,
      this.cartOwner,
      super.cartProductsEntity,
      this.createdAt,
      this.updatedAt,
      super.iV,
      super.totalCartPrice});

  CartDataDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      cartProductsEntity = <CartProductsDto>[];
      json['products'].forEach((v) {
        cartProductsEntity!.add(CartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class CartProductsDto extends CartProductsEntity {
  CartProductsDto(
      {super.count, super.sId, super.price, super.productItemEntity});

  CartProductsDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];

    productItemEntity = json['product'] != null
        ? ProductItemDto.fromJson(json['product'])
        : null;

    price = json['price'];
  }
}

class ProductItemDto extends ProductItemEntity {
  ProductItemDto({
    super.brand,
    super.category,
    super.title,
    super.id,
    super.imageCover,
    super.quantity,
    super.ratingsAverage,
  });

  ProductItemDto.fromJson(Map<String, dynamic> json) {
    // subCategory = json['subcategory'] != null
    //     ? CartCategoryOrSubOrBrandDto.fromJson(json['subcategory'])
    //     : null;
    category = json['category'] != null
        ? CartCategoryOrSubOrBrandDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CartCategoryOrSubOrBrandDto.fromJson(json['brand'])
        : null;
    title = json['title'];
    imageCover = json['imageCover'];
    id = json['id'];
    quantity = json['quantity'];
    ratingsAverage = json['ratingsAverage'];
  }
}

class CartCategoryOrSubOrBrandDto extends CartCategoryOrSubOrBrandEntity {
  CartCategoryOrSubOrBrandDto(
      {super.sId, super.name, super.slug, super.category});

  CartCategoryOrSubOrBrandDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    image = json['image'];
  }
}
