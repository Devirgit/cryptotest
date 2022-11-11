part of 'stocks_bloc.dart';

abstract class StocksEvent extends Equatable {
  const StocksEvent(this.categoryUID);
  final int categoryUID;

  @override
  List<Object> get props => [categoryUID];
}

class StocksLoad extends StocksEvent {
  const StocksLoad(int categoryUID) : super(categoryUID);

  @override
  List<Object> get props => [categoryUID];
}

class FiltredData extends StocksEvent {
  const FiltredData(int categoryUID,
      {required this.endPeriod, required this.startPeriod})
      : super(categoryUID);

  final DateTime startPeriod;
  final DateTime endPeriod;

  @override
  List<Object> get props => [categoryUID, startPeriod, endPeriod];
}

class FiltredType extends StocksEvent {
  const FiltredType(int categoryUID, {required this.filterIndex})
      : super(categoryUID);

  final int filterIndex;

  @override
  List<Object> get props => [categoryUID, filterIndex];
}
