import 'package:cryptotest/core/components/respons.dart';
import 'package:cryptotest/core/error/exception.dart';
import 'package:cryptotest/core/error/failure.dart';
import 'package:cryptotest/data/api/interface/category_service_interface.dart';
import 'package:cryptotest/data/model/category_model.dart';
import 'package:cryptotest/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.categoryService});

  final CategoryService categoryService;

  @override
  Future<Respons<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final category = await categoryService.getCategories();

      return Right(category);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.type));
    }
  }
}
