import 'package:cuisine_circle/screens/FilterScreen.dart';
import 'package:cuisine_circle/screens/catagory_screen.dart';
import 'package:cuisine_circle/screens/meals_screen.dart';
import 'package:cuisine_circle/widgets/main_darwer.dart';
import 'package:flutter/material.dart';

import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _toggleFavouriteMealStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('This meal is no longer a favourite meal')));
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Meal added to the favourite lists')));
      });
    }
  }

  void _onSelect(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _selectScreen(String identifier) {
    if (identifier == 'Filters') {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFavouriteMeal: _toggleFavouriteMealStatus,
    );
    var activePageTitle = 'All Categories';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavouriteMeal: _toggleFavouriteMealStatus,
      );
      activePageTitle = 'Fav Meals';
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 49, 47, 47),
      appBar: AppBar(
        title: Text(activePageTitle),
        elevation: 0,
      ),
      drawer: MainDrawer(
        onSelectScreen: _selectScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(221, 195, 186, 186),
        onTap: _onSelect,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_rounded), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_purple500_rounded),
              label: 'Favourite'),
        ],
      ),
    );
  }
}
