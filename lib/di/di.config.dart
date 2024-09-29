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
import '../data/data_sources/remote_data_source/all_products_rmote_data_source/all_products_remote_data_source.dart'
    as _i330;
import '../data/data_sources/remote_data_source/all_products_rmote_data_source/all_products_remote_data_source_impl.dart'
    as _i233;
import '../data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i1036;
import '../data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i978;
import '../data/data_sources/remote_data_source/home_tab_data_source/home_tab_remote_data_source.dart'
    as _i490;
import '../data/data_sources/remote_data_source/home_tab_data_source/home_tab_remote_data_source_impl.dart'
    as _i710;
import '../data/repository/all_products_repository_impl.dart' as _i567;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/home_tab_repository_impl.dart' as _i859;
import '../domain/repository/all_products_repository.dart' as _i141;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/repository/home_tab_repository.dart' as _i1052;
import '../domain/use_cases/all_gategories_use_case.dart' as _i53;
import '../domain/use_cases/all_products_use_case.dart' as _i645;
import '../domain/use_cases/brands_use_case.dart' as _i135;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../features/auth/presentation/screens/login/login_screen_view_model.dart'
    as _i912;
import '../features/auth/presentation/screens/register/register_screen_view_model.dart'
    as _i890;
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
    gh.factory<_i826.LoginUseCase>(
        () => _i826.LoginUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i772.RegisterUseCase>(() =>
        _i772.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i490.HomeTabRemoteDataSource>(() =>
        _i710.HomeTabRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i330.AllProductsRemoteDataSource>(() =>
        _i233.AllProductsRemoteDataSourceImpl(
            apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i912.LoginScreenViewModel>(() =>
        _i912.LoginScreenViewModel(loginUseCase: gh<_i826.LoginUseCase>()));
    gh.factory<_i1052.HomeTabRepository>(() => _i859.HomeTabRepositoryImpl(
        homeTabRemoteDataSource: gh<_i490.HomeTabRemoteDataSource>()));
    gh.factory<_i141.AllProductsRepository>(() =>
        _i567.AllProductsRepositoryImpl(
            allProductsRemoteDataSource:
                gh<_i330.AllProductsRemoteDataSource>()));
    gh.factory<_i890.RegisterScreenViewModel>(() =>
        _i890.RegisterScreenViewModel(
            registerUseCase: gh<_i772.RegisterUseCase>()));
    gh.factory<_i53.AllCategoriesUseCase>(() => _i53.AllCategoriesUseCase(
        homeTabRepository: gh<_i1052.HomeTabRepository>()));
    gh.factory<_i135.BrandsUseCase>(() =>
        _i135.BrandsUseCase(homeTabRepository: gh<_i1052.HomeTabRepository>()));
    gh.factory<_i898.HomeTabViewModel>(() => _i898.HomeTabViewModel(
          allCategoriesUseCase: gh<_i53.AllCategoriesUseCase>(),
          brandsUseCase: gh<_i135.BrandsUseCase>(),
        ));
    gh.factory<_i645.AllProductsUseCase>(() => _i645.AllProductsUseCase(
        allProdactsRepository: gh<_i141.AllProductsRepository>()));
    gh.factory<_i979.ProductsScreenViewModel>(() =>
        _i979.ProductsScreenViewModel(
            allProductsUseCase: gh<_i645.AllProductsUseCase>()));
    return this;
  }
}
