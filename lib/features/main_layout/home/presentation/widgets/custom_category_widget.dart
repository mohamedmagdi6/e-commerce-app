import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CustomCategoryWidget extends StatelessWidget {
  CustomCategoryWidget({super.key, this.data});
  CategoriesOrBrandsDataEntity? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          imageUrl: data?.image ??
              "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        Text(
          data?.name ?? 'df',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}
