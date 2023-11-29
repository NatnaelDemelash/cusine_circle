import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(252, 20, 20, 20),
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_rounded,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(width: 18),
                Text(
                  'Cusine Foods',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )
              ],
            ),
          ),

          // ListTiles
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              color: Colors.white,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onTap: () {
              onSelectScreen('Meals');
            },
          ),

          const Divider(color: Colors.white),

          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              'Filter',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onTap: () {
              onSelectScreen('Filters');
            },
          ),

          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
