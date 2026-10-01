import 'package:flutter/material.dart';
import 'package:shrine/models/product.dart';
import 'package:shrine/models/products_repository.dart';

import 'model/product.dart';
import 'model/products_repository.dart';
import 'supplemental/asymmetric_view.dart';

/// Front layer of the Backdrop: just the product grid, filtered by [category].
class HomePage extends StatelessWidget {
  const HomePage({this.category = Category.all, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
  }
}