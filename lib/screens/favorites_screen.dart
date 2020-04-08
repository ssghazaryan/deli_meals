import 'package:DeliMeaks/widgets/meal_item.dart';

import '../models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteeMeals;
  FavoriteScreen(this.favoriteeMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteeMeals.isEmpty)
      return Text('You have no Favorites yet - start adding some!');
    else
      return ListView.builder(
          itemCount: favoriteeMeals.length,
          itemBuilder: (cxt, index) {
            return MealItem(
              favoriteeMeals[index],
              // removeItem: _removeMeal,
            );
          });
  }
}
