import 'package:equatable/equatable.dart';



abstract class LocalizationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocalizationInitial extends LocalizationState {}

class LocalizationLoaded extends LocalizationState {
  final String currentLocalization;
   LocalizationLoaded({
    required this.currentLocalization
 });


LocalizationLoaded copyWith({String? currentLocalization}) {
    return LocalizationLoaded(
        currentLocalization: currentLocalization ?? this.currentLocalization
    );
  }

  @override
  List<Object> get props => [currentLocalization];
}
