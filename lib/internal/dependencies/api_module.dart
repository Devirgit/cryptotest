import 'package:cryptotest/data/api/interface/category_service_interface.dart';
import 'package:cryptotest/data/api/interface/stock_service_interface.dart';
import 'package:cryptotest/data/api/testdata/test_category_service.dart';
import 'package:cryptotest/data/api/testdata/test_stock_service.dart';

class ApiModule {
  static CategoryService categoryService() => TestCategoryService();

  static StockService stockService() => TestStockService();
}
