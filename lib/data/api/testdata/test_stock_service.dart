import 'dart:convert';

import 'package:cryptotest/data/api/interface/stock_service_interface.dart';
import 'package:cryptotest/data/model/stock_model.dart';
import 'package:flutter/foundation.dart';

class TestStockService implements StockService {
  List<StockModel> _getCollection(int categoryUID) {
    if (!stockJson.containsKey(categoryUID)) {
      return [];
    }
    List<dynamic> items = jsonDecode(stockJson[categoryUID]!);
    final List<StockModel> result = [];
    if (items.isNotEmpty) {
      for (Map<String, dynamic> element in items) {
        result.add(StockModel.fromJson(element));
      }
    }
    return result;
  }

  @override
  Future<List<StockModel>> getStockCategory(int categoryUID) {
    return SynchronousFuture(_getCollection(categoryUID));
  }

  @override
  Future<List<StockModel>> getStockForPeriodCategory(int categoryUID,
      {required DateTime start, required DateTime end}) {
    final notfiltered = _getCollection(categoryUID);
    List<StockModel> stock = [];
    for (StockModel item in notfiltered) {
      if (item.date.compareTo(start) >= 0 && item.date.compareTo(end) <= 0) {
        stock.add(item);
      }
    }
    return SynchronousFuture(stock);
  }
}

Map<int, String> stockJson = {
  1: '[{"category_id": 1, "count": 69.75, "price": 70.5, "symbol": "DOT", "id": 0, "date": "2022-11-10 00:00:00.000", "type": 1},'
      '{"category_id": 1, "count": 134.0, "price": 41.57, "symbol": "DOT", "id": 1, "date": "2022-11-07 00:00:00.000", "type": 1},'
      '{"category_id": 1, "count": 108.14, "price": 74.0, "symbol": "DOT", "id": 2, "date": "2022-11-05 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 700.0, "price": 113.0, "symbol": "ETH", "id": 3, "date": "2022-11-04 00:00:00.000", "type": 1},'
      '{"category_id": 1, "count": 180.5, "price": 67.75, "symbol": "MATIC", "id": 4, "date": "2022-11-01 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 64.4, "price": 141.33, "symbol": "BTC", "id": 5, "date": "2022-10-28 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 30.5, "price": 189.67, "symbol": "BTC", "id": 6, "date": "2022-10-27 00:00:00.000", "type": 1},'
      '{"category_id": 1, "count": 98.0, "price": 143.4, "symbol": "DOT", "id": 7, "date": "2022-10-20 00:00:00.000", "type": 1},'
      '{"category_id": 1, "count": 108.57, "price": 43.29, "symbol": "ETH", "id": 8, "date": "2022-10-18 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 383.5, "price": 33.14, "symbol": "MATIC", "id": 9, "date": "2022-10-15 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 152.17, "price": 105.17, "symbol": "MATIC", "id": 10, "date": "2022-10-14 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 38.33, "price": 78.0, "symbol": "BTC", "id": 11, "date":"2022-10-01 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 20.8, "price": 0.14, "symbol": "BTC", "id": 12, "date": "2022-09-25 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 108.33, "price": 163.0, "symbol": "ETH", "id": 13, "date": "2022-09-20 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 172.67, "price": 14.71, "symbol": "DOT", "id": 14, "date": "2022-09-18 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 319.5, "price": 54.86, "symbol": "BTC", "id": 15, "date": "2022-09-14 00:00:00.000", "type": 1},'
      '{"category_id": 1, "count": 120.43, "price": 60.33, "symbol": "ETH", "id": 16, "date": "2022-09-12 00:00:00.000", "type": 1},'
      '{"category_id": 1, "count": 116.5, "price": 13.0, "symbol": "MATIC", "id": 17, "date": "2022-09-07 00:00:00.000", "type": 1},'
      '{"category_id": 1, "count": 72.0, "price": 84.0, "symbol": "DOT", "id": 18, "date": "2022-09-05 00:00:00.000", "type": 0},'
      '{"category_id": 1, "count": 101.0, "price": 68.57, "symbol": "ETH", "id": 19, "date": "2022-09-04 00:00:00.000", "type": 1}]',
  2: '[{"category_id": 2, "count": 76.57, "price": 90.29, "symbol": "Сбер", "id": 20, "date": "2022-11-09 00:00:00.000", "type": 1},'
      '{"category_id": 2, "count": 807.0, "price": 51.43, "symbol": "Лукойл", "id": 21, "date": "2022-11-05 00:00:00.000", "type": 1},'
      '{"category_id": 2, "count": 135.86, "price": 167.5, "symbol": "Альфа", "id": 22, "date": "2022-11-04 00:00:00.000", "type": 0},'
      '{"category_id": 2, "count": 459.5, "price": 128.75, "symbol": "Тат", "id": 23, "date": "2022-11-02 00:00:00.000", "type": 0},'
      '{"category_id": 2, "count": 49.5, "price": 125.25, "symbol": "Сбер", "id": 24, "date": "2022-11-01 00:00:00.000", "type": 0}]'
};
