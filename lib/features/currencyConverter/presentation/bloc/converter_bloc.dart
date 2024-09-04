import 'package:currencies_converter/features/currencyConverter/presentation/bloc/converter_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'converter_event.dart';

@injectable
class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {

  ConverterBloc(
      ) : super(ConverterInitial()) {

    on<LoadConverterEvent>(_onLoadConvert);
  }

  Future<void> _onLoadConvert(
      LoadConverterEvent event, Emitter<ConverterState> emit) async {
    try {
     emit(ConverterLoaded(value: event.amount * ((1/event.from )/ (1/event.to ))));
    } catch (e) {
      emit(ConverterError(e.toString()));
    }
  }
}
