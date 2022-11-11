import 'package:cryptotest/internal/dependencies/di.dart';
import 'package:cryptotest/internal/dependencies/repository_module.dart';

abstract class Dependency {
  static init() {
    Di.reg(() => RepositoryModule.inst.categoryRepository());
    Di.reg(() => RepositoryModule.inst.stockRepository());
  }
}
