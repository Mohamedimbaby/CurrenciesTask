import 'package:currencies_converter/core/localStorage/currencies/currency_local_storage.dart';
import 'package:currencies_converter/features/currenciesListing/data/dataSource/data_source.dart';
import 'package:currencies_converter/features/currenciesListing/data/services/currencies_services.dart';
import 'package:currencies_converter/features/currenciesListing/data/services/flags_service.dart';
import 'package:currencies_converter/features/currenciesListing/domain/repository/currencies_repository.dart';
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockCurrenciesService extends Mock implements CurrenciesService {}


class MockGetCurrenciesUseCase extends Mock
    implements GetCurrenciesUseCase {}

class MockCurrenciesRepository extends Mock
    implements CurrenciesRepository {}
class MockSharedPreferencesProvider extends Mock
    implements SharedPreferences {}
class MockLocalDataSource extends Mock
    implements DataSource {}
class MockFlagService extends Mock
    implements FlagsService {}
class MockCurrencyLocalStorage extends Mock
    implements CurrencyLocalStorage {}
