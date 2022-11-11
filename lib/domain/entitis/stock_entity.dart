import 'package:cryptotest/core/types/types.dart';
import 'package:equatable/equatable.dart';

class StockEntity extends Equatable {
  const StockEntity({
    required this.uid,
    required this.categoryUID,
    required this.count,
    required this.symbol,
    required this.price,
    required this.date,
    required this.operationType,
  });

  final int uid;
  final int categoryUID;
  final String symbol;
  final double count;
  final double price;
  final DateTime date;
  final OperationType operationType;

  @override
  List<Object?> get props => [
        uid,
        categoryUID,
        symbol,
        count,
        price,
        operationType,
      ];
}

class FilterStockParams {
  const FilterStockParams(
      {required this.categoryUID,
      required this.endPeriod,
      required this.startPeriod});

  final int categoryUID;
  final DateTime startPeriod;
  final DateTime endPeriod;
}
