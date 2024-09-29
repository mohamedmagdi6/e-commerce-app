import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';

class AllProductsResponseEntity {
  int? results;
  List<ProductDataEntity>? data;

  AllProductsResponseEntity({this.results, this.data});
}

class ProductDataEntity {
  int? sold;
  List<String>? images;
  int? ratingsQuantity;
  String? sId;
  String? title;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoriesOrBrandsDataEntity? category;
  CategoriesOrBrandsDataEntity? brand;
  num? ratingsAverage;

  int? priceAfterDiscount;
  List<Null>? availableColors;

  ProductDataEntity(
      {this.sold,
      this.images,
      this.ratingsQuantity,
      this.sId,
      this.title,
      this.description,
      this.quantity,
      this.price,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.priceAfterDiscount,
      this.availableColors});
}
