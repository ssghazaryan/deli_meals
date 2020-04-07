import 'package:DeliMeaks/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({@required this.categoryId,@required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routArgs["title"];
    final categoryId = routArgs["id"];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (cxt, index) {
            return MealItem(categoryMeals[index]);
          }),
    );
  }
}
