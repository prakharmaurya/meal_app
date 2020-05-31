import 'package:flutter/material.dart';

import './models/meal.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final catogeryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    final categoryTitle = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return Text(catogeryMeals[index].title);
        },
        itemCount: catogeryMeals.length,
      )),
    );
  }
}
