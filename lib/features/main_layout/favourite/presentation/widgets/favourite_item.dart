import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/features/main_layout/favourite/presentation/favourite_screen_cubit/favourite_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/heart_button.dart';
import 'add_to_cart_button.dart';
import 'favourite_item_details.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, this.product, this.productDataEntity});
  final Map<String, dynamic>? product;
  final ProductDataEntity? productDataEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s135.h,
      padding: EdgeInsets.only(right: AppSize.s8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16.r),
          border: Border.all(color: ColorManager.primary.withOpacity(.3))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                border:
                    Border.all(color: ColorManager.primary.withOpacity(.6))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s16.r),
              child: CachedNetworkImage(
                width: AppSize.s120.w,
                height: AppSize.s135.h,
                fit: BoxFit.cover,
                imageUrl: product == null
                    ? productDataEntity?.imageCover
                    : product?["imageUrl"],
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: ColorManager.primary,
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: AppSize.s8.w),
                  child: FavouriteItemDetails(
                    product: product,
                    productDataEntity: productDataEntity,
                  ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HeartButton(
                onTap: () {
                  FavouriteScreenViewModel.get(context)
                      .deleteWishlistProduct(productDataEntity?.sId ?? '');
                },
                id: '',
              ),
              SizedBox(height: AppSize.s14.h),
              AddToCartButton(
                onPressed: () {
                  //TODO:add product to cart
                },
                text: AppConstants.addToCart,
              )
            ],
          )
        ],
      ),
    );
  }
}
