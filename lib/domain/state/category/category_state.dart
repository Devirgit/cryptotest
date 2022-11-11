part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState._(
      {this.status = LoadDataStatus.none,
      this.categories = const <CategoryEntity>[],
      this.selectIndex = -1,
      this.errorMessage});

  const CategoryState.initial() : this._();

  const CategoryState.loadInProgress() : this._(status: LoadDataStatus.loading);

  const CategoryState.failureload(String message)
      : this._(status: LoadDataStatus.failure, errorMessage: message);

  const CategoryState.loadSuccess(
      {required List<CategoryEntity> categories, int? selectIndex})
      : this._(
            categories: categories,
            status: LoadDataStatus.success,
            selectIndex: selectIndex ?? -1);

  CategoryState copyWith({
    List<CategoryEntity>? categories,
    LoadDataStatus? status,
    String? errorMessage,
    int? selectIndex,
  }) {
    return CategoryState._(
      selectIndex: selectIndex ?? this.selectIndex,
      categories: categories ?? this.categories,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  final List<CategoryEntity> categories;
  final LoadDataStatus status;
  final String? errorMessage;
  final int selectIndex;

  @override
  List<Object> get props => [categories, status, selectIndex];
}
