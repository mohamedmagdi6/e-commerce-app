class CategoriesOrBrandsResponseEntity {
  int? results;
  String? message;
  List<CategoriesOrBrandsDataEntity>? data;

  CategoriesOrBrandsResponseEntity({this.results, this.data, this.message});
}

class CategoriesOrBrandsDataEntity {
  String? sId;
  String? name;
  String? image;

  CategoriesOrBrandsDataEntity({
    this.sId,
    this.name,
    this.image,
  });
}
