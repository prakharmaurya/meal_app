import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;

  FavouriteScreen(this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet...'),
      );
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: _favouriteMeals[index].id,
              title: _favouriteMeals[index].title,
              imageUrl: _favouriteMeals[index].imageUrl,
              duration: _favouriteMeals[index].duration,
              complexity: _favouriteMeals[index].complexity,
              affordability: _favouriteMeals[index].affordability,
            );
          },
          itemCount: _favouriteMeals.length,
        ),
      );
    }
  }
}
