import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import 'screens/filters_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (ctx) => TabSreen(),
        CategoryMealsScreen.routName : (ctx) => CategoryMealsScreen(), 
        MealDetailScreen.routName : (ctx) => MealDetailScreen(),
        FilteresScreen.routName:  (ctx) => FilteresScreen(),
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
