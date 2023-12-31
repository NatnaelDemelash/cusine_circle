import 'package:cuisine_circle/screens/meals_screen.dart';
import 'package:cuisine_circle/widgets/category_grid.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../model/category.dart';
import '../model/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.onToggleFavouriteMeal});

  final void Function(Meal meal) onToggleFavouriteMeal;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeal,
          onToggleFavouriteMeal: onToggleFavouriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => {
              _selectCategory(context, category),
            },
          )
      ],
    );
  }
}
