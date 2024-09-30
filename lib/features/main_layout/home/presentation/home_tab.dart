import 'dart:async';

import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/home_tab_cubits/home_tab_states.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/home_tab_cubits/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_category_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  // HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: HomeTabViewModel.get(context)
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAdsWidget(
                adsImages: HomeTabViewModel.get(context).adsImages,
                currentIndex: HomeTabViewModel.get(context).currentIndex,
              ),
              Column(
                children: [
                  CustomSectionBar(sectionNname: 'Categories', function: () {}),
                  HomeTabViewModel.get(context).categoryData != null
                      ? SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryWidget(
                                data: HomeTabViewModel.get(context)
                                    .categoryData![index],
                              );
                            },
                            itemCount: HomeTabViewModel.get(context)
                                .categoryData!
                                .length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        )
                      : Skeletonizer(
                          child: SizedBox(
                            height: 270.h,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CustomCategoryWidget();
                              },
                              itemCount: 15,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 12.h),
                  CustomSectionBar(sectionNname: 'Brands', function: () {}),
                  HomeTabViewModel.get(context).brandsData != null
                      ? SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryWidget(
                                data: HomeTabViewModel.get(context)
                                    .brandsData![index],
                              );
                            },
                            itemCount: HomeTabViewModel.get(context)
                                .brandsData!
                                .length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        )
                      : Skeletonizer(
                          child: SizedBox(
                            height: 270.h,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CustomCategoryWidget();
                              },
                              itemCount: 15,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 12.h),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
