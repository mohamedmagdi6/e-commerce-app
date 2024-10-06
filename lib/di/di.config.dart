// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager.dart' as _i704;
import '../data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i1036;
import '../data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i978;
import '../data/data_sources/remote_data_source/cart_items_data_source/cart_items_remote_data_source.dart'
    as _i97;
import '../data/data_sources/remote_data_source/cart_items_data_source/cart_items_remote_data_source_impl.dart'
    as _i356;
import '../data/data_sources/remote_data_source/home_tab_data_source/home_tab_remote_data_source.dart'
    as _i490;
import '../data/data_sources/remote_data_source/home_tab_data_source/home_tab_remote_data_source_impl.dart'
    as _i710;
import '../data/data_sources/remote_data_source/products_tab_rmote_data_source/all_products_remote_data_source.dart'
    as _i401;
import '../data/data_sources/remote_data_source/products_tab_rmote_data_source/all_products_remote_data_source_impl.dart'
    as _i79;
import '../data/repository/all_products_repository_impl.dart' as _i567;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/cart_items_repository_impl.dart' as _i1018;
import '../data/repository/home_tab_repository_impl.dart' as _i859;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/repository/cart_items_repository.dart' as _i499;
import '../domain/repository/home_tab_repository.dart' as _i1052;
import '../domain/repository/products_tab_repository.dart' as _i961;
import '../domain/use_cases/add_products_use_case.dart' as _i1028;
import '../domain/use_cases/all_gategories_use_case.dart' as _i53;
import '../domain/use_cases/all_products_use_case.dart' as _i645;
import '../domain/use_cases/brands_use_case.dart' as _i135;
import '../domain/use_cases/cart_items_use_case.dart' as _i88;
import '../domain/use_cases/delete_cart_items_use_case.dart' as _i314;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/update_product_use_case.dart' as _i607;
import '../features/auth/presentation/screens/login/login_screen_view_model.dart'
    as _i912;
import '../features/auth/presentation/screens/register/register_screen_view_model.dart'
    as _i890;
import '../features/cart/screens/cart_screen_cubit/cart_screen_view_model.dart'
    as _i504;
import '../features/main_layout/home/presentation/home_tab_cubits/home_tab_view_model.dart'
    as _i898;
import '../features/products_screen/presentation/screens/products_screen_view_model.dart'
    as _i979;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i704.ApiManager>(() => _i704.ApiManager());
    gh.factory<_i1036.AuthRemoteDataSource>(() =>
        _i978.AuthRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i1036.AuthRemoteDataSource>()));
    gh.factory<_i401.ProductsTabRemoteDataSource>(() =>
        _i79.AllProductsRemoteDataSourceImpl(
            apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i826.LoginUseCase>(
        () => _i826.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i772.RegisterUseCase>(() =>
        _i772.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i97.CartItemsRemoteDataSource>(() =>
        _i356.CartItemsRemoteDataSourceImpl(
            apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i490.HomeTabRemoteDataSource>(() =>
        _i710.HomeTabRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i912.LoginScreenViewModel>(() =>
        _i912.LoginScreenViewModel(loginUseCase: gh<_i826.LoginUseCase>()));
    gh.factory<_i499.CartItemsRepository>(() => _i1018.CartItemsRepositoryImpl(
        cartItemsRemoteDataSource: gh<_i97.CartItemsRemoteDataSource>()));
    gh.factory<_i314.DeleteCartItemsUseCase>(() => _i314.DeleteCartItemsUseCase(
        cartItemsRepository: gh<_i499.CartItemsRepository>()));
    gh.factory<_i607.UpdateProductUseCase>(() => _i607.UpdateProductUseCase(
        cartItemsRepository: gh<_i499.CartItemsRepository>()));
    gh.factory<_i961.ProductsTabRepository>(() =>
        _i567.AllProductsRepositoryImpl(
            productsTabRemoteDataSource:
                gh<_i401.ProductsTabRemoteDataSource>()));
    gh.factory<_i88.CartItemsUseCase>(() => _i88.CartItemsUseCase(
        cartItemRepository: gh<_i499.CartItemsRepository>()));
    gh.factory<_i1052.HomeTabRepository>(() => _i859.HomeTabRepositoryImpl(
        homeTabRemoteDataSource: gh<_i490.HomeTabRemoteDataSource>()));
    gh.factory<_i890.RegisterScreenViewModel>(() =>
        _i890.RegisterScreenViewModel(
            registerUseCase: gh<_i772.RegisterUseCase>()));
    gh.factory<_i1028.AddProductsUseCase>(() => _i1028.AddProductsUseCase(
        productsTabRepository: gh<_i961.ProductsTabRepository>()));
    gh.factory<_i53.AllCategoriesUseCase>(() => _i53.AllCategoriesUseCase(
        homeTabRepository: gh<_i1052.HomeTabRepository>()));
    gh.factory<_i135.BrandsUseCase>(() =>
        _i135.BrandsUseCase(homeTabRepository: gh<_i1052.HomeTabRepository>()));
    gh.factory<_i898.HomeTabViewModel>(() => _i898.HomeTabViewModel(
          allCategoriesUseCase: gh<_i53.AllCategoriesUseCase>(),
          brandsUseCase: gh<_i135.BrandsUseCase>(),
        ));
    gh.factory<_i645.AllProductsUseCase>(() => _i645.AllProductsUseCase(
        allProdactsRepository: gh<_i961.ProductsTabRepository>()));
    gh.factory<_i504.CartScreenViewModel>(() => _i504.CartScreenViewModel(
          cartItemsUseCase: gh<_i88.CartItemsUseCase>(),
          deleteCartItemsUseCase: gh<_i314.DeleteCartItemsUseCase>(),
          updateProductUseCase: gh<_i607.UpdateProductUseCase>(),
        ));
    gh.factory<_i979.ProductsScreenViewModel>(
        () => _i979.ProductsScreenViewModel(
              allProductsUseCase: gh<_i645.AllProductsUseCase>(),
              addProductsUseCase: gh<_i1028.AddProductsUseCase>(),
            ));
    return this;
  }
}
