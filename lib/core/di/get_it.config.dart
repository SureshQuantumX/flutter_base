// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../config/router/app_router.dart' as _i238;
import '../../features/jsonPlaceHolder/data/data_source/jph_remote_data_source.dart'
    as _i8;
import '../../features/jsonPlaceHolder/data/jph_repository_impl/jph_repository_impl.dart'
    as _i499;
import '../../features/jsonPlaceHolder/domain/repository/jph_repository.dart'
    as _i1054;
import '../../features/jsonPlaceHolder/presentation/cubit/jph_cubit.dart'
    as _i190;
import '../api/api_client.dart' as _i277;
import 'di_module.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i361.Dio>(() => injectionModule.dio());
    gh.lazySingleton<_i238.AppRouter>(() => _i238.AppRouter());
    gh.lazySingleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i8.JphRemoteDataSource>(
      () => _i8.JphRemoteDataSourceImpl(apiClient: gh<_i277.ApiClient>()),
    );
    gh.lazySingleton<_i1054.JphRepository>(
      () => _i499.JphRepositoryImpl(gh<_i8.JphRemoteDataSource>()),
    );
    gh.factory<_i190.JphCubit>(
      () => _i190.JphCubit(gh<_i1054.JphRepository>()),
    );
    return this;
  }
}

class _$InjectionModule extends _i211.InjectionModule {}
