part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategoryEvent extends CategoryEvent {
  const GetAllCategoryEvent();

  @override
  List<Object> get props => [];
}

class SelectCategory extends CategoryEvent {
  const SelectCategory(this.item);

  final CategoryEntity item;
  @override
  List<Object> get props => [item];
}
