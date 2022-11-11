import 'package:cryptotest/core/components/respons.dart';
import 'package:cryptotest/core/error/failure.dart';
import 'package:cryptotest/domain/entitis/category_entity.dart';

abstract class CategoryRepository {
  Future<Respons<Failure, List<CategoryEntity>>> getAllCategories();
}
