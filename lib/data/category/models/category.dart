import 'dart:convert';

import 'package:e_commerce_app/domain/category/entity/category.dart';

class CategoryModel {
  final String title;
  final String categoryId;
  final String image;

  CategoryModel(
      {required this.title, required this.categoryId, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Title': title,
      'CategoryId': categoryId,
      'Image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['Title'] ?? '' as String,
      categoryId: map['CategoryId'] ?? '' as String,
      image: map['Image'] ?? '' as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(categoryId: categoryId, image: image, title: title);
  }
}
