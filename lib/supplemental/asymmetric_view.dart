import 'package:flutter/material.dart';
import 'package:shrine/models/product.dart';

import '../model/product.dart';
import 'product_columns.dart';

/// Horizontally scrolling "woven" layout: columns alternate between
/// two cards (even) and one card (odd).
class AsymmetricView extends StatelessWidget {
  const AsymmetricView({super.key, required this.products});

  final List<Product> products;

  List<Widget> _buildColumns(BuildContext context) {
    if (products.isEmpty) {
      return const <Widget>[];
    }

    return List<Widget>.generate(_listItemCount(products.length), (int index) {
      double width = .59 * MediaQuery.of(context).size.width;
      final Widget column;
      if (index.isEven) {
        final int bottom = _evenCasesIndex(index);
        column = TwoProductCardColumn(
          bottom: products[bottom],
          top: products.length - 1 >= bottom + 1 ? products[bottom + 1] : null,
        );
        width += 32.0;
      } else {
        column = OneProductCardColumn(product: products[_oddCasesIndex(index)]);
      }
      return SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: column,
        ),
      );
    });
  }

  int _evenCasesIndex(int input) => input ~/ 2 * 3;

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    return (totalItems % 3 == 0)
        ? totalItems ~/ 3 * 2
        : (totalItems / 3).ceil() * 2 - 1;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
      physics: const AlwaysScrollableScrollPhysics(),
      children: _buildColumns(context),
    );
  }
}