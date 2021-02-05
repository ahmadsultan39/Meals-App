import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List fav;

  FavouritesScreen(this.fav);

  @override
  Widget build(BuildContext context) {
    if (fav.isEmpty)
    return const Center(
      child: Text('fav'),
    );
    else 
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(fav[index]);
        },
        itemCount: fav.length,
      );
  }
}
