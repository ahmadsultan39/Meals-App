import 'package:Meals_App/screens/category_meals.dart';
import 'package:flutter/material.dart';

import '../models/Category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(CategoryMealsScreen.namedRoute, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(20),
      splashColor: Theme.of(context).accentColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [category.color.withOpacity(0.70), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            )),
      ),
    );
  }
}
