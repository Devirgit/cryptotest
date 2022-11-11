part of 'stocks_bloc.dart';

class StocksState extends Equatable {
  const StocksState._(
      {this.status = LoadDataStatus.none,
      this.stocks = const [],
      this.errorMessage,
      this.filterIndex = -1,
      this.endPeriod,
      this.startPeriod});

  final LoadDataStatus status;
  final List<StockEntity> stocks;
  final String? errorMessage;
  final DateTime? startPeriod;
  final DateTime? endPeriod;
  final int filterIndex;

  const StocksState.init() : this._();

  const StocksState.success(List<StockEntity> items,
      {DateTime? startPeriod, DateTime? endPeriod, int? filterIndex})
      : this._(
            stocks: items,
            startPeriod: startPeriod,
            endPeriod: endPeriod,
            filterIndex: filterIndex ?? 0,
            status: LoadDataStatus.success);

  const StocksState.loading() : this._(status: LoadDataStatus.loading);

  const StocksState.error(String message)
      : this._(errorMessage: message, status: LoadDataStatus.failure);

  StocksState copyWith(
      {List<StockEntity>? stocks,
      LoadDataStatus? status,
      DateTime? startPeriod,
      DateTime? endPeriod,
      int? filterIndex,
      String? errorMessage}) {
    return StocksState._(
      stocks: stocks ?? this.stocks,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      filterIndex: filterIndex ?? this.filterIndex,
      endPeriod: endPeriod ?? this.endPeriod,
      startPeriod: startPeriod ?? this.startPeriod,
    );
  }

  @override
  List<Object> get props => [status, stocks, filterIndex];
}
