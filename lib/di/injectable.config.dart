// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_base_flutter/core/network/dio_client.dart' as _i10;
import 'package:app_base_flutter/core/network/rest_client.dart' as _i6;
import 'package:app_base_flutter/datasource/local_data_source/base_local_source.dart'
    as _i3;
import 'package:app_base_flutter/datasource/local_data_source/i_base_local_data_source.dart'
    as _i5;
import 'package:app_base_flutter/datasource/remote_data_source/base_remote_data_source.dart'
    as _i13;
import 'package:app_base_flutter/datasource/remote_data_source/i_base_remote_data_source.dart'
    as _i11;
import 'package:app_base_flutter/datasource/shared_preference_data_source/base_shared_prefrence.dart'
    as _i8;
import 'package:app_base_flutter/datasource/shared_preference_data_source/i_base_shared_prefrence.dart'
    as _i12;
import 'package:app_base_flutter/di/%20module/app_module.dart' as _i16;
import 'package:app_base_flutter/di/%20module/network_module.dart' as _i18;
import 'package:app_base_flutter/di/%20module/preference_module.dart' as _i17;
import 'package:app_base_flutter/repository/base_repository.dart' as _i14;
import 'package:app_base_flutter/repository/i_base_repository.dart' as _i15;
import 'package:dio/dio.dart' as _i9;
import 'package:get/get.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final app = _$App();
    final preferenceModule = _$PreferenceModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i3.BaseLocalDataSource>(() => _i3.BaseLocalDataSource.from());
    gh.lazySingleton<_i4.GetMaterialApp>(
        () => app.provideGetMaterialApp(gh<_i3.BaseLocalDataSource>()));
    gh.singleton<_i5.ImplementBaseLocalDataSource>(
        () => _i5.ImplementBaseLocalDataSource());
    gh.lazySingleton<_i6.RestClient>(() => _i6.RestClient());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => preferenceModule.prefs,
      preResolve: true,
    );
    gh.factory<String>(() => networkModule.TAG);
    gh.factory<_i8.BaseSharedPreference>(
        () => _i8.BaseSharedPreference.create(gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i9.Dio>(() => networkModule.provideDio(
          gh<_i8.BaseSharedPreference>(),
          gh<_i3.BaseLocalDataSource>(),
        ));
    gh.lazySingleton<_i10.DioClient>(() => _i10.DioClient(gh<_i9.Dio>()));
    gh.lazySingleton<_i11.ImplementBaseRemoteDataSource>(
        () => _i11.ImplementBaseRemoteDataSource(
              gh<_i10.DioClient>(),
              gh<_i6.RestClient>(),
            ));
    gh.singleton<_i12.ImplementBaseSharedPreference>(
        () => _i12.ImplementBaseSharedPreference(gh<_i7.SharedPreferences>()));
    gh.factory<_i13.BaseRemoteDataSource>(
        () => _i13.BaseRemoteDataSource.create(
              gh<_i10.DioClient>(),
              gh<_i6.RestClient>(),
            ));
    gh.factory<_i14.BaseRepository>(() => _i14.BaseRepository.create(
          gh<_i13.BaseRemoteDataSource>(),
          gh<_i3.BaseLocalDataSource>(),
          gh<_i8.BaseSharedPreference>(),
        ));
    gh.lazySingleton<_i15.ImplementBaseRepository>(
        () => _i15.ImplementBaseRepository(
              gh<_i13.BaseRemoteDataSource>(),
              gh<_i3.BaseLocalDataSource>(),
              gh<_i8.BaseSharedPreference>(),
            ));
    return this;
  }
}

class _$App extends _i16.App {}

class _$PreferenceModule extends _i17.PreferenceModule {}

class _$NetworkModule extends _i18.NetworkModule {}
