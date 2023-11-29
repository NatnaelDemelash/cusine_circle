import 'package:cuisine_circle/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meals,
      this.title,
      required this.onToggleFavouriteMeal});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, indx) => MealItem(
        meal: meals[indx],
        onToggleFavouriteMeal: onToggleFavouriteMeal,
      ),
    );

    // ignore: curly_braces_in_flow_control_structures
    if (meals.isEmpty)
      // ignore: curly_braces_in_flow_control_structures
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh Oh....There is Nothing Here',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 15),
            Text(
              'Try Selecting a different Category',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      );

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        elevation: 0,
      ),
      body: content,
    );
  }
}
