import 'dart:async';

import 'package:cryptotest/core/types/types.dart';
import 'package:cryptotest/domain/entitis/stock_entity.dart';
import 'package:cryptotest/domain/repository/stock_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'stocks_event.dart';
part 'stocks_state.dart';

class StocksBloc extends Bloc<StocksEvent, StocksState> {
  StocksBloc({required StockRepository stockRepository})
      : _stockRepository = stockRepository,
        super(const StocksState.init()) {
    on<StocksLoad>(_onStockLoad);
    on<FiltredData>(_onStocksFiltred);
    on<FiltredType>(_onFiltredType);
  }

  final StockRepository _stockRepository;

  Future<void> _onFiltredType(
    FiltredType event,
    Emitter<StocksState> emit,
  ) async {
    emit(state.copyWith(filterIndex: event.filterIndex));
  }

  Future<void> _onStocksFiltred(
    FiltredData event,
    Emitter<StocksState> emit,
  ) async {
    int filterIndex = state.filterIndex;
    emit(const StocksState.loading());

    final stocks = await _stockRepository.getFilteredStockCategory(
        FilterStockParams(
            categoryUID: event.categoryUID,
            endPeriod: event.endPeriod,
            startPeriod: event.startPeriod));

    stocks.result((error) {
      emit(StocksState.error(error.message));
    },
        (stocks) => emit(StocksState.success(stocks,
            endPeriod: event.endPeriod,
            startPeriod: event.startPeriod,
            filterIndex: filterIndex)));
  }

  Future<void> _onStockLoad(
    StocksLoad event,
    Emitter<StocksState> emit,
  ) async {
    emit(const StocksState.loading());

    final stocks = await _stockRepository.getStockCategory(event.categoryUID);

    stocks.result((error) {
      emit(StocksState.error(error.message));
    }, (stocks) => emit(StocksState.success(stocks)));
  }
}
