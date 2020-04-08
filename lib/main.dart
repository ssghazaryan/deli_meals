import './dummy_data.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import 'models/meal.dart';
import 'screens/filters_screen.dart';

void main() {
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteeMeals = [];

  void _setFilters(Map<String, bool> filtesData) {
    print('hes');
    setState(() {
      _filters = filtesData;
    });
    _availableMeals = DUMMY_MEALS.where((element) {
      if (_filters['gluten'] && element.isGlutenFree) return true;
      if (_filters['lactose'] && element.isLactoseFree) return true;
      if (_filters['vegan'] && element.isVegan) return true;
      if (_filters['vegetarian'] && element.isVegetarian) return true;
      return false;
    }).toList();
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteeMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0)
      setState(() {
        _favoriteeMeals.removeAt(existingIndex);
      });
    else
      setState(() {
        _favoriteeMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
  }

   bool _isMealFavorite(String id){
    return _favoriteeMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        // canvasColor: Color.fromARGB(255, 254, 339, 1),
        fontFamily: 'Realway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
              bodyText2: TextStyle(
                color: Colors.black,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabSreen(_favoriteeMeals),
        CategoryMealsScreen.routName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilteresScreen.routName: (ctx) => FilteresScreen(_setFilters, _filters),
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //  // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
