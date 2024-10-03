import 'dart:convert';
import 'package:e_commerce_app/domain/product/entity/color.dart';

class ProductColorModel {
  final String title;
  final List<int> rgb;

  ProductColorModel({required this.title, required this.rgb});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'rgb': rgb,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      rgb: List<int>.from(
        map['rgb'].map((e) => e),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductColorModelX on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      rgb: rgb,
    );
  }
}
