part of 'converter_bloc.dart';

abstract class ConverterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadConverterEvent extends ConverterEvent {
  final num from ,to ;
  final num amount  ;

  LoadConverterEvent({required this.from,required this.to,required this.amount});
  @override
  List<Object> get props => [from,to,amount];

}


