import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/all_gategories_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/brands_use_case.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/home_tab_cubits/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  AllCategoriesUseCase allCategoriesUseCase;
  BrandsUseCase brandsUseCase;
  HomeTabViewModel(
      {required this.allCategoriesUseCase, required this.brandsUseCase})
      : super(HomeTabInitState());

  List<CategoriesOrBrandsDataEntity>? categoryData;
  List<CategoriesOrBrandsDataEntity>? brandsData;
  final int currentIndex = 0;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  static HomeTabViewModel get(context) => BlocProvider.of(
      context); // function to return object of HomeTabViewModel.

  getAllCategories() async {
    emit(AllCategoriesLoadingState());
    var either = await allCategoriesUseCase.invoke();
    either.fold(
      (categoryResponse) {
        categoryData = categoryResponse.data!;
        emit(AllCategoriesSuccessState(
            categoriesResponseEntity: categoryResponse));
      },
      (error) {
        emit(AllCategoriesFailureState(failures: error));
      },
    );
  }

  getAllBrands() async {
    emit(BrandsLoadingState());
    var either = await brandsUseCase.invoke();
    either.fold(
      (brandsResponse) {
        brandsData = brandsResponse.data!;

        emit(BrandsSuccessState(brandsResponseEntity: brandsResponse));
      },
      (error) {
        emit(BrandsFailureState(failures: error));
      },
    );
  }
}
