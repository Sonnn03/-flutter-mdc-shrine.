import 'package:flutter/material.dart';
import 'package:shrine/models/product.dart';

import '../model/product.dart';
import 'product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  const TwoProductCardColumn({
    super.key,
    required this.bottom,
    this.top,
  });

  static const double spacerHeight = 44.0;

  final Product bottom;
  final Product? top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
        final double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
        final double imageAspectRatio = heightOfImages >= 0.0
            ? constraints.biggest.width / heightOfImages
            : 49.0 / 33.0;

        // ListView (not Column) so the layout survives the backdrop animation
        // squeezing the front layer without overflow errors.
        return ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 28.0),
              child: top != null
                  ? ProductCard(
                      imageAspectRatio: imageAspectRatio,
                      product: top!,
                    )
                  : SizedBox(height: heightOfCards),
            ),
            const SizedBox(height: spacerHeight),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 28.0),
              child: ProductCard(
                imageAspectRatio: imageAspectRatio,
                product: bottom,
              ),
            ),
          ],
        );
      },
    );
  }
}

class OneProductCardColumn extends StatelessWidget {
  const OneProductCardColumn({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      reverse: true,
      children: <Widget>[
        const SizedBox(height: 40.0),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: ProductCard(product: product),
        ),
      ],
    );
  }
}