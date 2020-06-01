import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> dummyfilteredMeals;

  CategoryMealsScreen(this.dummyfilteredMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    displayedMeal = widget.dummyfilteredMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    categoryTitle = routeArgs['title'];
    super.didChangeDependencies();
  }

  void _removeMeals(String mealId) {
    setState(
      () {
        displayedMeal.removeWhere((meal) => meal.id == mealId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              duration: displayedMeal[index].duration,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
              removeItem: _removeMeals,
            );
          },
          itemCount: displayedMeal.length,
        ),
      ),
    );
  }
}
