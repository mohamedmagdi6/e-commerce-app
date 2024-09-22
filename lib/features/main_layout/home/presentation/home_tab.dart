import 'dart:async';

import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/home_tab_cubits/all_categories_states.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/home_tab_cubits/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_brand_widget.dart';
import 'widgets/custom_category_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final int _currentIndex = 0;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel..getAllCategories(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAdsWidget(
                adsImages: adsImages,
                currentIndex: _currentIndex,
              ),
              Column(
                children: [
                  CustomSectionBar(sectionNname: 'Categories', function: () {}),
                  state is AllCategoriesSuccessState
                      ? SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryWidget(
                                data:
                                    state.categoriesResponseEntity.data![index],
                              );
                            },
                            itemCount:
                                state.categoriesResponseEntity.data!.length,
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
                  SizedBox(
                    height: 270.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const CustomBrandWidget();
                      },
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
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
