part of 'currencies_bloc.dart';

abstract class CurrenciesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCurrenciesEvent extends CurrenciesEvent {}

