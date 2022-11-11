import 'package:cryptotest/core/types/types.dart';
import 'package:cryptotest/domain/entitis/stock_entity.dart';

class StockModel extends StockEntity {
  StockModel({
    required int uid,
    required int categoryUID,
    required String symbol,
    required double count,
    required double price,
    required DateTime date,
    required int typeID,
  }) : super(
          categoryUID: categoryUID,
          count: count,
          price: price,
          symbol: symbol,
          uid: uid,
          date: date,
          operationType: _typeOperation(typeID),
        );

  StockModel.fromJson(Map<String, dynamic> map)
      : super(
          categoryUID: map['category_id'] as int,
          count: map['count'] * 1.0,
          price: map['price'] * 1.0,
          symbol: map['symbol'] as String,
          uid: map['id'] as int,
          date: DateTime.parse(map['date']),
          operationType: _typeOperation(map['type'] as int),
        );

  static _typeOperation(int typeID) =>
      typeID == 1 ? OperationType.buy : OperationType.sell;
}
