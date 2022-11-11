import 'package:cryptotest/core/components/respons.dart';
import 'package:cryptotest/core/error/exception.dart';
import 'package:cryptotest/core/error/failure.dart';
import 'package:cryptotest/data/api/interface/stock_service_interface.dart';
import 'package:cryptotest/data/model/stock_model.dart';
import 'package:cryptotest/domain/entitis/stock_entity.dart';
import 'package:cryptotest/domain/repository/stock_repository.dart';

class StockRepositoryImpl extends StockRepository {
  StockRepositoryImpl({required this.stockService});

  final StockService stockService;

  Future<Respons<Failure, T>> _catchData<T>(ResultFunction<T> onAction) async {
    try {
      return Right(await onAction());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.type));
    }
  }

  @override
  Future<Respons<Failure, List<StockModel>>> getStockCategory(int uid) async {
    return await _catchData(
        () async => await stockService.getStockCategory(uid));
  }

  @override
  Future<Respons<Failure, List<StockModel>>> getFilteredStockCategory(
      FilterStockParams params) async {
    return await _catchData(() async =>
        await stockService.getStockForPeriodCategory(params.categoryUID,
            end: params.endPeriod, start: params.startPeriod));
  }
}
