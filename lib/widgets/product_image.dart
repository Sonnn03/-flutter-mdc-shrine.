import 'package:flutter/material.dart';
import 'package:shrine/models/product.dart';

import '../model/product.dart';

/// Placeholder "photo" for a product: a soft gradient with an icon.
class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            product.color,
            Color.lerp(product.color, Colors.white, 0.5)!,
          ],
        ),
      ),
      child: Center(
        child: Icon(product.icon, size: 48.0, color: Colors.white70),
      ),
    );
  }
}