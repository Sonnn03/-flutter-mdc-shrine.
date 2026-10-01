import 'package:flutter/material.dart';
import 'package:shrine/models/product.dart';

import '../model/product.dart';
import '../widgets/product_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.imageAspectRatio = 33 / 49,
    required this.product,
  });

  static const double kTextBoxHeight = 65.0;

  final double imageAspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: imageAspectRatio,
          child: ProductImage(product: product),
        ),
        SizedBox(
          height: MediaQuery.textScalerOf(context).scale(kTextBoxHeight),
          width: 121.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                product.name,
                style: theme.textTheme.labelLarge,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 4.0),
              Text(
                product.formattedPrice,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}