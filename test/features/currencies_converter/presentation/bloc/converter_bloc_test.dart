
import 'package:bloc_test/bloc_test.dart';
import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currenciesListing/domain/useCase/get_currencies_use_case.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/bloc/currencies_bloc.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/bloc/currencies_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  String appExceptionTitle = 'app exception Title';
  GetCurrenciesUseCase mockGetCurrenciesUseCase = MockGetCurrenciesUseCase();
  group('test Get the currencies bloc ', () {
    blocTest(
      'test Get the currencies successfully',
      setUp: () {
        when(
              ()  =>  mockGetCurrenciesUseCase.execute(),
        ).thenAnswer((_)=>Future.value(<CurrencyData>[
          CurrencyData("us", "united states",currency: "usd",price: 48)
        ]));
      },
      build: () => CurrenciesBloc(mockGetCurrenciesUseCase),
      act: (CurrenciesBloc bloc) => bloc.add(LoadCurrenciesEvent()),
      expect: () =>
      const [
        TypeMatcher<CurrenciesLoaded>()
      ],
    );
    blocTest(
      'test Get the currencies with error',
      setUp: () {
        when(
              ()  =>  mockGetCurrenciesUseCase.execute(),
        ).thenThrow((_)=>Exception(appExceptionTitle));
      },
      build: () => CurrenciesBloc(mockGetCurrenciesUseCase),
      act: (CurrenciesBloc bloc) => bloc.add(LoadCurrenciesEvent()),
      expect: () =>
      const [
        TypeMatcher<CurrenciesError>()
      ],
    );
    blocTest(
      'test Get the currencies with no usd data ',
      setUp: () {
        when(
              ()  =>  mockGetCurrenciesUseCase.execute(),
        ).thenAnswer((_)=>Future.value(<CurrencyData>[
          CurrencyData("eg", "egp",currency: "egp",price: 1)
        ]));
      },
      build: () => CurrenciesBloc(mockGetCurrenciesUseCase),
      act: (CurrenciesBloc bloc) => bloc.add(LoadCurrenciesEvent()),
      expect: () =>
      const [
        TypeMatcher<CurrenciesLoaded>(),
      ],
    );
  });
}
