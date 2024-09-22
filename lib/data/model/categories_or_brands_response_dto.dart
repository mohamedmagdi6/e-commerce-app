import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';

class CategoriesOrBrandsResponseDto extends CategoriesOrBrandsResponseEntity {
  MetadataDto? metadata;

  CategoriesOrBrandsResponseDto({super.results, this.metadata, super.data});

  CategoriesOrBrandsResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(CategoriesOrBrandsDataDto.fromJson(v));
      });
    }
  }
}

class MetadataDto {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataDto({this.currentPage, this.numberOfPages, this.limit});

  MetadataDto.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}

class CategoriesOrBrandsDataDto extends CategoriesOrBrandsDataEntity {
  String? slug;

  String? createdAt;
  String? updatedAt;

  CategoriesOrBrandsDataDto(
      {super.sId,
      super.name,
      this.slug,
      super.image,
      this.createdAt,
      this.updatedAt});

  CategoriesOrBrandsDataDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
