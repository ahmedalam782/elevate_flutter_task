// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:elevate_flutter_task/core/di/register_modules.dart' as _i281;
import 'package:elevate_flutter_task/core/network/local/cache_helper.dart'
    as _i1009;
import 'package:elevate_flutter_task/core/network/local/shared_preferences_cashed.dart'
    as _i633;
import 'package:elevate_flutter_task/core/network/remote/api_consumer.dart'
    as _i553;
import 'package:elevate_flutter_task/core/network/remote/dio_consumer.dart'
    as _i315;
import 'package:elevate_flutter_task/features/products/data/data_sources/remote/products_api_remote_data_sources.dart'
    as _i512;
import 'package:elevate_flutter_task/features/products/data/data_sources/remote/products_remote_data_sources.dart'
    as _i663;
import 'package:elevate_flutter_task/features/products/data/repositories/products_repository_impl.dart'
    as _i160;
import 'package:elevate_flutter_task/features/products/domain/repositories/products_repository.dart'
    as _i37;
import 'package:elevate_flutter_task/features/products/domain/use_cases/products.dart'
    as _i616;
import 'package:elevate_flutter_task/features/products/presentation/view_model/cubit/product_cubit.dart'
    as _i784;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.instance,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i553.ApiConsumer>(() => _i315.DioConsumer(gh<_i361.Dio>()));
    gh.singleton<_i663.ProductsRemoteDataSources>(
        () => _i512.ProductsApiRemoteDataSources(gh<_i553.ApiConsumer>()));
    gh.singleton<_i1009.CacheHelper>(
        () => _i633.SharedPreferencesCashed(gh<_i460.SharedPreferences>()));
    gh.singleton<_i37.ProductsRepository>(() =>
        _i160.ProductsRepositoryImpl(gh<_i663.ProductsRemoteDataSources>()));
    gh.singleton<_i616.Products>(
        () => _i616.Products(gh<_i37.ProductsRepository>()));
    gh.singleton<_i784.ProductCubit>(
        () => _i784.ProductCubit(gh<_i616.Products>()));
    return this;
  }
}

class _$RegisterModule extends _i281.RegisterModule {}
