import 'package:flutter/material.dart';

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const List<Product> allProducts = <Product>[
      // Accessories
      Product(category: Category.accessories, id: 0, isFeatured: true, name: 'Vagabond sack', price: 120, icon: Icons.shopping_bag, color: Color(0xFFD98C7F)),
      Product(category: Category.accessories, id: 1, isFeatured: true, name: 'Stella sunglasses', price: 58, icon: Icons.visibility, color: Color(0xFF8C6A5D)),
      Product(category: Category.accessories, id: 2, isFeatured: false, name: 'Whitney belt', price: 35, icon: Icons.straighten, color: Color(0xFFC9A28F)),
      Product(category: Category.accessories, id: 3, isFeatured: true, name: 'Strut earrings', price: 34, icon: Icons.auto_awesome, color: Color(0xFFE3A5A5)),
      Product(category: Category.accessories, id: 4, isFeatured: false, name: 'Gatsby hat', price: 40, icon: Icons.checkroom, color: Color(0xFF7A5C61)),
      Product(category: Category.accessories, id: 5, isFeatured: true, name: 'Shrug bag', price: 198, icon: Icons.work, color: Color(0xFFB5766B)),
      // Clothing
      Product(category: Category.clothing, id: 6, isFeatured: true, name: 'Sunshirt dress', price: 58, icon: Icons.dry_cleaning, color: Color(0xFFF2B8A6)),
      Product(category: Category.clothing, id: 7, isFeatured: false, name: 'Fine lines tee', price: 58, icon: Icons.checkroom, color: Color(0xFF9B7B76)),
      Product(category: Category.clothing, id: 8, isFeatured: true, name: 'Ginger scarf', price: 98, icon: Icons.style, color: Color(0xFFD08F7A)),
      Product(category: Category.clothing, id: 9, isFeatured: false, name: 'Plaster tunic', price: 38, icon: Icons.dry_cleaning, color: Color(0xFFB59A91)),
      Product(category: Category.clothing, id: 10, isFeatured: true, name: 'Seaside sweater', price: 85, icon: Icons.checkroom, color: Color(0xFFE09F94)),
      Product(category: Category.clothing, id: 11, isFeatured: false, name: 'Walter henley', price: 38, icon: Icons.style, color: Color(0xFF86645F)),
      // Home
      Product(category: Category.home, id: 12, isFeatured: true, name: 'Gilt desk trio', price: 58, icon: Icons.lightbulb, color: Color(0xFFD9A441)),
      Product(category: Category.home, id: 13, isFeatured: false, name: 'Chambray napkins', price: 16, icon: Icons.restaurant, color: Color(0xFF8FA3B5)),
      Product(category: Category.home, id: 14, isFeatured: true, name: 'Kitchen quattro', price: 29, icon: Icons.kitchen, color: Color(0xFFB87C6D)),
      Product(category: Category.home, id: 15, isFeatured: false, name: 'Clay mug set', price: 24, icon: Icons.coffee, color: Color(0xFFA9776B)),
      Product(category: Category.home, id: 16, isFeatured: true, name: 'Linen throw', price: 64, icon: Icons.weekend, color: Color(0xFFCBB4A9)),
      Product(category: Category.home, id: 17, isFeatured: false, name: 'Garden chair', price: 98, icon: Icons.chair, color: Color(0xFF7D8F6E)),
    ];

    if (category == Category.all) {
      return allProducts;
    }
    return allProducts.where((Product p) => p.category == category).toList();
  }
}