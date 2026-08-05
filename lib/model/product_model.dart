import 'package:flutter/material.dart';

class ColorOption {
  final String name;
  final Color color;
  final String imagePath;

  ColorOption({required this.name, required this.color, required this.imagePath});

  factory ColorOption.fromMap(Map<String, dynamic> map) {
    return ColorOption(
      name: map['name'],
      color: Color(int.parse(map['color_code'])),
      imagePath: map['image_path'],
    );
  }
}

class Product {
  final String id;
  final String name;
  final String brand;
  final double price;
  final double rating;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final List<ColorOption> colors;
  final String reviews;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
    required this.gallery,
    required this.colors,
    required this.reviews,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'].toString(),
      name: map['name'],
      brand: map['brand'],
      price: (map['price'] as num).toDouble(),
      rating: (map['rating'] as num).toDouble(),
      imageUrl: map['image_url'],
      description: map['description'],
      gallery: List<String>.from(map['gallery'] ?? []),
      reviews: map['reviews'] ?? "",
      colors: (map['product_colors'] as List? ?? [])
          .map((c) => ColorOption.fromMap(c))
          .toList(),
    );
  }
}