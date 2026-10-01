import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Category { all, accessories, clothing, home }

class Product {
  const Product({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.price,
    required this.icon,
    required this.color,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final double price;

  /// Placeholder visual (the original codelab uses image assets).
  final IconData icon;
  final Color color;

  String get formattedPrice =>
      NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 0)
          .format(price);

  @override
  String toString() => '$name (id=$id)';
}