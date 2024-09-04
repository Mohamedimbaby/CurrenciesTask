import 'package:equatable/equatable.dart';



abstract class ConverterState extends Equatable {
  @override
  List<Object> get props => [];
}

class ConverterInitial extends ConverterState {}
class ConverterError extends ConverterState {
  final String error ;
  ConverterError(this.error);
}

class ConverterLoaded extends ConverterState {
  final num value;


  ConverterLoaded( {
    required this.value,
  });


  ConverterLoaded copyWith({num? price}) {
    return ConverterLoaded(value: price ?? value
    );
  }

  @override
  List<Object> get props => [value];
}
