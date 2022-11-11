import 'package:cryptotest/domain/entitis/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required int uid, required String name})
      : super(uid: uid, name: name);

  CategoryModel.fromJson(Map<String, dynamic> map)
      : super(
          uid: map['id'] as int,
          name: map['name'] as String,
        );
}
