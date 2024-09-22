import 'package:e_commerce_app/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/all_gategories_use_case.dart';
import 'package:e_commerce_app/features/main_layout/home/presentation/home_tab_cubits/all_categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  AllCategoriesUseCase allCategoriesUseCase;
  HomeTabViewModel({required this.allCategoriesUseCase})
      : super(AllCategoriesLoadingState());

  List<CategoriesOrBrandsDataEntity> data = [];

  getAllCategories() async {
    emit(AllCategoriesLoadingState());
    var either = await allCategoriesUseCase.invoke();
    either.fold(
      (categoryResponse) {
        data = categoryResponse.data!;
        print(data);
        emit(AllCategoriesSuccessState(
            categoriesResponseEntity: categoryResponse));
      },
      (error) {
        emit(AllCategoriesFailureState(failures: error));
      },
    );
  }
}
