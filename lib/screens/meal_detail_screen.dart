import 'package:DeliMeaks/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/MealDetailScreen';

  Widget buildSectionTitle(String text, context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 200,
        width: 350,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              buildSectionTitle("Ingrediets", context),
              buildContainer(
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 37,
                      child: Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(meal.ingredients[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              buildSectionTitle("Steps", context),
              buildContainer(
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.pop(context, meal.id);
        },
      ),
    );
  }
}
