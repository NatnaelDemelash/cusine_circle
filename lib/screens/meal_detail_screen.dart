import 'package:cuisine_circle/model/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavouriteMeal});

  final Meal meal;
  final void Function(Meal meal) onToggleFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 49, 47, 47),
      appBar: AppBar(
        title: Text(meal.title),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavouriteMeal(meal);
            },
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
            const Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 15),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: const TextStyle(
                    height: 1.8, fontSize: 17, color: Colors.white),
              ),
            const SizedBox(height: 20),
            const Text(
              'Steps',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 15),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
