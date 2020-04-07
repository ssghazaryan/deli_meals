import 'package:DeliMeaks/models/meal.dart';
import 'package:DeliMeaks/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  String categoryId;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
  final routArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routArgs["title"];
    categoryId = routArgs["id"];
    displayedMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (cxt, index) {
            return MealItem(displayedMeals[index],removeItem: _removeMeal,);
          }),
    );
  }
}
