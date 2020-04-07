import 'package:DeliMeaks/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(Function function, IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 27,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(() {
            Navigator.pushReplacementNamed(context, '/');
          }, Icons.restaurant, 'Meals'),
          buildListTile(() {
            Navigator.pushReplacementNamed(context, FilteresScreen.routName);
          }, Icons.settings, 'Filters'),
        ],
      ),
    );
  }
}
