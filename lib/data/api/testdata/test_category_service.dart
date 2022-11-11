import 'package:cryptotest/data/api/interface/category_service_interface.dart';
import 'package:cryptotest/data/model/category_model.dart';
import 'package:flutter/foundation.dart';

class TestCategoryService implements CategoryService {
  @override
  Future<List<CategoryModel>> getCategories() {
    return SynchronousFuture([
      const CategoryModel(uid: 1, name: 'Crypro'),
      const CategoryModel(uid: 2, name: 'Fonda'),
    ]);
  }
}
