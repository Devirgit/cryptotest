import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.uid,
    this.name = '',
  });

  final int uid;
  final String name;

  bool get isEmpty => uid < 0;
  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [uid, name];
}
