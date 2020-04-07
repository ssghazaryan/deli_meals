import 'package:DeliMeaks/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/MealDetailScreen';
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.id),
      ),
      body: Container(child: Text(meal.title),),
    );
  }
}
