import 'package:e_commerce_app/features/products_screen/presentation/screens/products_screen_states.dart';
import 'package:e_commerce_app/features/products_screen/presentation/screens/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../routes_manager/routes.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: SvgPicture.asset(
        SvgAssets.routeLogo,
        height: 25.h,
        width: 25.w,
        colorFilter:
            const ColorFilter.mode(ColorManager.textColor, BlendMode.srcIn),
      ),
      bottom: PreferredSize(
          preferredSize: const Size(AppSize.s100, AppSize.s60),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: ColorManager.primary,
                    style: getRegularStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: AppMargin.m12.w,
                          vertical: AppMargin.m8.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.primary)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.primary)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: AppSize.s1, color: ColorManager.error)),
                      prefixIcon: ImageIcon(
                        AssetImage(IconsAssets.icSearch),
                        color: ColorManager.primary,
                      ),
                      hintText: "what do you search for?",
                      hintStyle: getRegularStyle(
                          color: ColorManager.primary, fontSize: FontSize.s16),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.cartRoute),
                    icon: BlocBuilder<ProductsScreenViewModel,
                        ProductsScreenStates>(
                      builder: (context, state) {
                        return Badge(
                          label: Text(ProductsScreenViewModel.get(context)
                              .numOfProducts
                              .toString()),
                          child: ImageIcon(
                            AssetImage(IconsAssets.icCart),
                            color: ColorManager.primary,
                          ),
                        );
                      },
                    ))
              ],
            ),
          )),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
