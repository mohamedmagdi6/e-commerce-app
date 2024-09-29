import 'package:e_commerce_app/domain/entities/all_products_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/all_products_use_case.dart';
import 'package:e_commerce_app/features/products_screen/presentation/screens/products_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsScreenViewModel extends Cubit<ProductsScreenStates> {
  AllProductsUseCase allProductsUseCase;
  ProductsScreenViewModel({required this.allProductsUseCase})
      : super(ProductsScreenLoadingState());
  List<ProductDataEntity> products = [];
  void getAllProduts() async {
    emit(ProductsScreenLoadingState());
    var either = await allProductsUseCase.invoke();
    either.fold(
      (response) {
        products = response.data!;
        emit(ProductsScreenSuccessState(responseEntity: response));
      },
      (error) {
        emit(ProductsScreenFailureState(failures: error));
      },
    );
  }
}
