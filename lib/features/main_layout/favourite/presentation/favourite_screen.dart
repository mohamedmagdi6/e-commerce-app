import 'package:e_commerce_app/features/main_layout/favourite/presentation/favourite_screen_cubit/favourite_screen_states.dart';
import 'package:e_commerce_app/features/main_layout/favourite/presentation/favourite_screen_cubit/favourite_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'widgets/favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteScreenViewModel, FavouriteScreenStates>(
      bloc: FavouriteScreenViewModel.get(context)..getWishlistProducts(),
      builder: (context, state) {
        if (state is FavouriteScreenSuccessState) {
          return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
              child: ListView.builder(
                itemCount: state.allProductsResponseEntity.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                    child: FavoriteItem(
                        productDataEntity:
                            state.allProductsResponseEntity.data![index]),
                  );
                },
              ));
        } else {
          return Skeletonizer(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
                  child: ListView.builder(
                    itemCount: AppConstants.favoriteProducts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                        child: FavoriteItem(
                            product: AppConstants.favoriteProducts[index]),
                      );
                    },
                  )));
        }
      },
    );
  }
}
