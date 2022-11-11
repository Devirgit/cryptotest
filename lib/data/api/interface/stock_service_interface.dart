import 'package:cryptotest/data/model/stock_model.dart';

abstract class StockService {
  Future<List<StockModel>> getStockCategory(
    int categoryUID,
  );

  Future<List<StockModel>> getStockForPeriodCategory(int categoryUID,
      {required DateTime start, required DateTime end});
}
