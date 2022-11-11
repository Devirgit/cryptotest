import 'package:cryptotest/core/types/types.dart';
import 'package:cryptotest/domain/entitis/category_entity.dart';
import 'package:cryptotest/domain/repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(const CategoryState.initial()) {
    on<GetAllCategoryEvent>(_onGetAllCategory);
    on<SelectCategory>(_onSelectCategory);
  }

  final CategoryRepository _categoryRepository;

  Future<void> _onSelectCategory(
    SelectCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(
        selectIndex:
            state.categories.indexWhere((element) => event.item == element)));
  }

  Future<void> _onGetAllCategory(
    GetAllCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState.loadInProgress());
    final categories = await _categoryRepository.getAllCategories();
    categories.result((error) {
      emit(CategoryState.failureload(error.message));
    },
        (categories) => emit(CategoryState.loadSuccess(
            categories: categories, selectIndex: categories.isEmpty ? -1 : 0)));
  }
}
