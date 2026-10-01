import 'package:flutter/material.dart';
import 'package:shrine/models/product.dart';

import 'colors.dart';
import 'model/product.dart';

class CategoryMenuPage extends StatelessWidget {
  const CategoryMenuPage({
    super.key,
    required this.currentCategory,
    required this.onCategoryTap,
  });

  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;

  Widget _buildCategory(Category category, BuildContext context) {
    final String categoryString = category.name.toUpperCase();
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory
          ? Column(
              children: <Widget>[
                const SizedBox(height: 16.0),
                Text(
                  categoryString,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14.0),
                Container(
                  width: 70.0,
                  height: 2.0,
                  color: kShrinePink400,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                categoryString,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: kShrineBrown900.withAlpha(153),
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 40.0),
        color: kShrinePink100,
        child: ListView(
          children: Category.values
              .map((Category c) => _buildCategory(c, context))
              .toList(),
        ),
      ),
    );
  }
}