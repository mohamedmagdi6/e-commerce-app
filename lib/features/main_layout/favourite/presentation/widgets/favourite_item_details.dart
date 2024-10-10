import 'package:colornames/colornames.dart';
import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import 'custom_txt_widget.dart';

class FavouriteItemDetails extends StatelessWidget {
  const FavouriteItemDetails({this.product, super.key, this.productDataEntity});
  final ProductDataEntity? productDataEntity;

  final Map<String, dynamic>? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: productDataEntity?.title ?? ' ',
          textStyle: getSemiBoldStyle(
              color: ColorManager.primaryDark, fontSize: AppSize.s18.sp),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: AppSize.s10.w),
              width: AppSize.s14.w,
              height: AppSize.s14.h,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
            CustomTextWgt(
              data: product == null
                  ? 'balck'
                  : (product?["color"] as Color).colorName,
              textStyle: getMediumStyle(
                  color: ColorManager.primaryDark, fontSize: AppSize.s14.sp),
            ),
          ],
        ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${productDataEntity?.price}  ',
              textStyle: getSemiBoldStyle(
                      color: ColorManager.primaryDark, fontSize: AppSize.s18.sp)
                  .copyWith(
                letterSpacing: 0.17,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: AppSize.s10.h,
                  ),
                  CustomTextWgt(
                      data: 'EGP ${productDataEntity?.priceAfterDiscount ?? 0}',
                      textStyle: getMediumStyle(
                              color:
                                  ColorManager.appBarTitleColor.withOpacity(.6))
                          .copyWith(
                              letterSpacing: 0.17,
                              decoration: TextDecoration.lineThrough,
                              color:
                                  ColorManager.appBarTitleColor.withOpacity(.6),
                              fontSize: AppSize.s10.sp)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
