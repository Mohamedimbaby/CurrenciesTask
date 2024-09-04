// presentation/bloc/converter_event.dart
part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadLocalizationEvent extends LocalizationEvent {}

class ChangeLocalizationEvent extends LocalizationEvent {}
