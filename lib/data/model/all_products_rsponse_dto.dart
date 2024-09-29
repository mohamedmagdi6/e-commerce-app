import 'package:e_commerce_app/data/model/categories_or_brands_response_dto.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';

class AllProductsResponseDto extends AllProductsResponseEntity {
  Metadata? metadata;
  String? statusMsg;
  String? message;

  AllProductsResponseDto(
      {super.results, this.metadata, super.data, this.message, this.statusMsg});

  AllProductsResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <ProductDataDto>[];
      json['data'].forEach((items) {
        data!.add(ProductDataDto.fromJson(items));
      });
    }
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}

class ProductDataDto extends ProductDataEntity {
  List<CategoriesOrBrandsDataDto>? subcategory;

  String? slug;

  String? createdAt;
  String? updatedAt;
  String? id;

  ProductDataDto({
    super.sold,
    super.images,
    this.subcategory,
    super.ratingsQuantity,
    super.sId,
    super.title,
    this.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
    super.priceAfterDiscount,
  });

  ProductDataDto.fromJson(Map<String, dynamic> json) {
    sold = json['sold'];
    images = json['images'].cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <CategoriesOrBrandsDataDto>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(CategoriesOrBrandsDataDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    brand = json['brand'] != null
        ? new CategoriesOrBrandsDataDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    priceAfterDiscount = json['priceAfterDiscount'];
  }
}
