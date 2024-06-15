import 'package:aspen/core/storage/end_points.dart';

class CategoryModel {
  final int id;
  final String name;

  const CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json[ID],
        name: json[NAME],
      );

  static List<CategoryModel> formMapList(List<Map<String,dynamic>> data) {
    return data.map((item) => CategoryModel.fromMap(item)).toList();
  }
}
