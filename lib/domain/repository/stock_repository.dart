import 'package:cryptotest/core/components/respons.dart';
import 'package:cryptotest/core/error/failure.dart';
import 'package:cryptotest/domain/entitis/stock_entity.dart';

abstract class StockRepository {
  Future<Respons<Failure, List<StockEntity>>> getStockCategory(int uid);

  Future<Respons<Failure, List<StockEntity>>> getFilteredStockCategory(
      FilterStockParams params);
}
