class CartItemsEntity {
  int? numOfCartItems;
  CartDataEntity? cartDataEntity;

  CartItemsEntity({this.numOfCartItems, this.cartDataEntity});
}

class CartDataEntity {
  List<CartProductsEntity>? cartProductsEntity;
  int? iV;
  int? totalCartPrice;

  CartDataEntity({this.cartProductsEntity, this.iV, this.totalCartPrice});
}

class CartProductsEntity {
  int? count;
  String? sId;
  ProductItemEntity? productItemEntity;
  int? price;

  CartProductsEntity({
    this.count,
    this.sId,
    this.productItemEntity,
    this.price,
  });
}

class ProductItemEntity {
  CartCategoryOrSubOrBrandEntity? subCategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CartCategoryOrSubOrBrandEntity? brand;
  CartCategoryOrSubOrBrandEntity? category;
  num? ratingsAverage;
  ProductItemEntity(
      {this.brand,
      this.category,
      this.id,
      this.title,
      this.imageCover,
      this.quantity,
      this.ratingsAverage,
      this.subCategory});
}

class CartCategoryOrSubOrBrandEntity {
  String? sId;
  String? name;
  String? slug;
  String? category;
  String? image;

  CartCategoryOrSubOrBrandEntity(
      {this.sId, this.name, this.slug, this.category});
}
