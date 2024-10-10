import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/domain/entities/add_product_to_wishlist_enttiy.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/features/products_screen/presentation/screens/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widget/heart_button.dart';

// ignore: must_be_immutable
class CustomProductWidget extends StatelessWidget {
  ProductDataEntity? productDataEntity;
  String? wishId;

  CustomProductWidget({super.key, this.productDataEntity, this.wishId});

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primary.withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              // Not working with the lastest flutter version

              CachedNetworkImage(
                imageUrl: productDataEntity == null
                    ? ''
                    : productDataEntity!.imageCover!,
                height: 128.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Image(image: AssetImage(ImageAssets.errorImage)),
              ),
              Positioned(
                  top: 30.h,
                  right: 30.h,
                  child: HeartButton(
                    onTap: () {
                      ProductsScreenViewModel.get(context)
                          .addProductToWishlist(productDataEntity!.sId!);
                    },
                    id: productDataEntity == null
                        ? ''
                        : productDataEntity!.sId ?? '',
                    wishId: wishId,
                  )),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateTitle(productDataEntity == null
                        ? ''
                        : productDataEntity!.title!),
                    style: getMediumStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    truncateDescription(productDataEntity == null
                        ? ''
                        : productDataEntity!.description!),
                    style: getRegularStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    width: 127.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP ${productDataEntity == null ? '' : productDataEntity!.price!}",
                          style: getRegularStyle(
                            color: ColorManager.textColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "${productDataEntity == null ? '0' : productDataEntity!.priceAfterDiscount ?? '0'} %",
                          style: getTextWithLine(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // width: width * 0.22,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Review (${productDataEntity == null ? '' : productDataEntity!.ratingsAverage!})",
                              style: getRegularStyle(
                                color: ColorManager.textColor,
                                fontSize: 12.sp,
                              ),
                            ),
                            const Icon(
                              Icons.star_rate_rounded,
                              color: ColorManager.starRateColor,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            ProductsScreenViewModel.get(context)
                                .addProduct(productDataEntity!.sId!);
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.primary,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
