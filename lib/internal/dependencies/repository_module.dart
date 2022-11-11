import 'package:cryptotest/data/repository/category_repository_impl.dart';
import 'package:cryptotest/data/repository/stock_repository_impl.dart';
import 'package:cryptotest/domain/repository/category_repository.dart';
import 'package:cryptotest/domain/repository/stock_repository.dart';
import 'package:cryptotest/internal/dependencies/api_module.dart';

class RepositoryModule {
  RepositoryModule._();

  static final inst = RepositoryModule._();

  CategoryRepository categoryRepository() =>
      CategoryRepositoryImpl(categoryService: ApiModule.categoryService());

  StockRepository stockRepository() =>
      StockRepositoryImpl(stockService: ApiModule.stockService());
}
