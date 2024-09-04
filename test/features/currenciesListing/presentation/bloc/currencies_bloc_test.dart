
import 'package:bloc_test/bloc_test.dart';
import 'package:currencies_converter/features/currencyConverter/presentation/bloc/converter_bloc.dart';
import 'package:currencies_converter/features/currencyConverter/presentation/bloc/converter_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test Get the currencies bloc ', () {
    blocTest(
      'test Get the currencies successfully',
      build: () => ConverterBloc(),
      act: (ConverterBloc bloc) => bloc.add(LoadConverterEvent(from: 1, to: 1, amount: 15)),
      expect: () {
       return const [
          TypeMatcher<ConverterLoaded>(),];
      },verify: (b){
        if(b.state is ConverterLoaded )
        {
          return (b.state as ConverterLoaded).value == 15;
        }
      }
    );
  });

}
