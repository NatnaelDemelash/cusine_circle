import 'package:cuisine_circle/screens/catagory_screen.dart';
import 'package:cuisine_circle/screens/meals_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  void _onSelect(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoryScreen();
    var activePageTitle = 'All Categories';

    if (selectedPageIndex == 1) {
      activePage = const MealsScreen(meals: []);
      activePageTitle = 'Fav Meals';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
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
