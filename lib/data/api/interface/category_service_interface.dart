import 'package:cryptotest/data/model/category_model.dart';

abstract class CategoryService {
  Future<List<CategoryModel>> getCategories();
}
