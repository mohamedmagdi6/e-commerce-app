class AddProductsToCartEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddProductDataEntity? data;

  AddProductsToCartEntity(
      {this.status, this.message, this.numOfCartItems, this.cartId, this.data});
}

class AddProductDataEntity {
  String? sId;
  List<AddedProductEntity>? products;
  int? totalCartPrice;

  AddProductDataEntity({this.sId, this.products, this.totalCartPrice});
}

class AddedProductEntity {
  int? count;
  String? sId;
  String? product;
  int? price;

  AddedProductEntity({this.count, this.sId, this.product, this.price});
}
