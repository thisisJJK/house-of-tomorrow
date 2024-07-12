import 'package:flutter/material.dart';

class ProductColor {
  final String imageUrl;
  final Color color;

  const ProductColor({
    required this.color,
    required this.imageUrl,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      color: Color(int.tryParse(json['hexColor']) ?? 0xFF000000),
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
