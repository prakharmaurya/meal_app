import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

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
            return MealItem(
              id: catogeryMeals[index].id,
              title: catogeryMeals[index].title,
              imageUrl: catogeryMeals[index].imageUrl,
              duration: catogeryMeals[index].duration,
              complexity: catogeryMeals[index].complexity,
              affordability: catogeryMeals[index].affordability,
            );
          },
          itemCount: catogeryMeals.length,
        ),
      ),
    );
  }
}
