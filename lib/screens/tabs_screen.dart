import 'package:DeliMeaks/models/meal.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabSreen extends StatefulWidget {
  final List<Meal> favoriteeMeals;
  TabSreen(this.favoriteeMeals);
  @override
  _TabSreenState createState() => _TabSreenState();
}

class _TabSreenState extends State<TabSreen> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteeMeals),
        'title': 'Favorite',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
