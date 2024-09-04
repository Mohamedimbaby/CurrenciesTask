// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currencies_converter/core/localization/data/repository/localization_repository_impl.dart'
    as _i514;
import 'package:currencies_converter/core/localization/domain/repository/localization_repository.dart'
    as _i316;
import 'package:currencies_converter/core/localization/domain/useCase/get_current_localization_use_case.dart'
    as _i664;
import 'package:currencies_converter/core/localization/domain/useCase/set_current_localization_use_case.dart'
    as _i586;
import 'package:currencies_converter/core/localization/presentation/localization_bloc/localization_bloc.dart'
    as _i897;
import 'package:currencies_converter/core/localStorage/currencies/currencies_database.dart'
    as _i947;
import 'package:currencies_converter/core/localStorage/currencies/currency_local_storage.dart'
    as _i604;
import 'package:currencies_converter/core/localStorage/flags/flags_reader.dart'
    as _i135;
import 'package:currencies_converter/core/networkProvider/dio_network_provider.dart'
    as _i799;
import 'package:currencies_converter/core/networkProvider/keys_provider.dart'
    as _i923;
import 'package:currencies_converter/core/networkProvider/network_provider.dart'
    as _i103;
import 'package:currencies_converter/core/theming/data/repository/theme_repository_impl.dart'
    as _i89;
import 'package:currencies_converter/core/theming/domain/repository/theme_repository.dart'
    as _i155;
import 'package:currencies_converter/core/theming/domain/useCase/get_theme_use_case.dart'
    as _i391;
import 'package:currencies_converter/core/theming/domain/useCase/toggle_use_case.dart'
    as _i248;
import 'package:currencies_converter/core/theming/presentation/theme_bloc/theme_bloc.dart'
    as _i256;
import 'package:currencies_converter/features/currenciesListing/data/dataSource/data_source.dart'
    as _i98;
import 'package:currencies_converter/features/currenciesListing/data/dataSource/local_data_source.dart'
    as _i1045;
import 'package:currencies_converter/features/currenciesListing/data/repository/currencies_repository_impl.dart'
    as _i890;
import 'package:currencies_converter/features/currenciesListing/data/services/currencies_services.dart'
    as _i139;
import 'package:currencies_converter/features/currenciesListing/data/services/flags_service.dart'
    as _i1002;
import 'package:currencies_converter/features/currenciesListing/domain/repository/currencies_repository.dart'
    as _i646;
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case.dart'
    as _i787;
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case_impl.dart'
    as _i1035;
import 'package:currencies_converter/features/currenciesListing/presentation/bloc/currencies_bloc.dart'
    as _i612;
import 'package:currencies_converter/features/currencyConverter/presentation/bloc/converter_bloc.dart'
    as _i984;
import 'package:currencies_converter/injector/modules/shared_pref_module.dart'
    as _i104;
import 'package:currencies_converter/injector/modules/sqflite_module.dart'
    as _i32;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:sqflite/sqflite.dart' as _i779;

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
    final sqfliteModule = _$SqfliteModule();
    final registerModule = _$RegisterModule();
    final keysProvider = _$KeysProvider();
    final networkProviderModule = _$NetworkProviderModule();
    await gh.factoryAsync<_i779.Database>(
      () => sqfliteModule.database,
      preResolve: true,
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i984.ConverterBloc>(() => _i984.ConverterBloc());
    gh.lazySingleton<_i135.FlagsJsonReader>(() => _i135.FlagsJsonReader());
    gh.lazySingleton<_i1002.FlagsService>(() => _i1002.FlagsService());
    gh.lazySingleton<_i604.CurrencyLocalStorage>(
        () => _i947.CurrencyDatabase(gh<_i779.Database>()));
    gh.lazySingleton<_i98.DataSource>(
        () => _i1045.LocalDataSource(gh<_i135.FlagsJsonReader>()));
    gh.factory<String>(
      () => keysProvider.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<String>(
      () => keysProvider.apiKey,
      instanceName: 'apiKey',
    );
    gh.lazySingleton<_i155.ThemeRepository>(
        () => _i89.ThemeRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i391.GetThemeUseCase>(
        () => _i391.GetThemeUseCase(gh<_i155.ThemeRepository>()));
    gh.lazySingleton<_i248.ToggleUseCase>(
        () => _i248.ToggleUseCase(gh<_i155.ThemeRepository>()));
    gh.lazySingleton<_i316.LocalizationRepository>(
        () => _i514.ThemeRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i256.ThemeBloc>(() => _i256.ThemeBloc(
          gh<_i391.GetThemeUseCase>(),
          gh<_i248.ToggleUseCase>(),
        ));
    gh.lazySingleton<_i103.NetworkProvider>(
        () => networkProviderModule.provideNetworkProvider(
              gh<String>(instanceName: 'apiKey'),
              gh<String>(instanceName: 'baseUrl'),
            ));
    gh.lazySingleton<_i664.GetCurrentLocalizationUseCase>(() =>
        _i664.GetCurrentLocalizationUseCase(
            gh<_i316.LocalizationRepository>()));
    gh.lazySingleton<_i586.SetCurrentLocalizationUseCase>(() =>
        _i586.SetCurrentLocalizationUseCase(
            gh<_i316.LocalizationRepository>()));
    gh.factory<_i897.LocalizationBloc>(() => _i897.LocalizationBloc(
          gh<_i664.GetCurrentLocalizationUseCase>(),
          gh<_i586.SetCurrentLocalizationUseCase>(),
        ));
    gh.lazySingleton<_i139.CurrenciesService>(() =>
        _i139.CurrenciesService(networkProvider: gh<_i103.NetworkProvider>()));
    gh.lazySingleton<_i646.CurrenciesRepository>(
        () => _i890.CurrenciesRepositoryImpl(
              currenciesService: gh<_i139.CurrenciesService>(),
              flagsService: gh<_i1002.FlagsService>(),
              currencyLocalStorage: gh<_i604.CurrencyLocalStorage>(),
              localDataSource: gh<_i98.DataSource>(),
            ));
    gh.lazySingleton<_i787.GetCurrenciesUseCase>(() =>
        _i1035.GetCurrenciesUseCaseImpl(gh<_i646.CurrenciesRepository>()));
    gh.factory<_i612.CurrenciesBloc>(
        () => _i612.CurrenciesBloc(gh<_i787.GetCurrenciesUseCase>()));
    return this;
  }
}

class _$SqfliteModule extends _i32.SqfliteModule {}

class _$RegisterModule extends _i104.RegisterModule {}

class _$KeysProvider extends _i923.KeysProvider {}

class _$NetworkProviderModule extends _i799.NetworkProviderModule {}
