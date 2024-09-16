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
import '../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i384;
import '../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i558;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../domain/repository/auth_repository.dart' as _i306;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../features/auth/presentation/screens/register/register_screen_view_model.dart'
    as _i890;

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
    gh.factory<_i384.AuthRemoteDataSource>(() =>
        _i558.AuthRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i306.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i384.AuthRemoteDataSource>()));
    gh.factory<_i772.RegisterUseCase>(() =>
        _i772.RegisterUseCase(authRepository: gh<_i306.AuthRepository>()));
    gh.factory<_i890.RegisterScreenViewModel>(() =>
        _i890.RegisterScreenViewModel(
            registerUseCase: gh<_i772.RegisterUseCase>()));
    return this;
  }
}
