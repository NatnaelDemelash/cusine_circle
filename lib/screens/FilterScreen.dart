import 'package:cuisine_circle/widgets/main_darwer.dart';
import 'package:cuisine_circle/widgets/tabs.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFreeSet = false;
  var isLactoseFreeSet = false;
  var isVegterianSet = false;
  var isVeganSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(221, 49, 47, 47),
        appBar: AppBar(
          title: const Text('Filters'),
          elevation: 0,
        ),
        drawer: MainDrawer(onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'Meals') {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
          }
        }),
        body: Column(
          children: [
            SwitchListTile(
              value: isGlutenFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  isGlutenFreeSet = isChecked;
                });
              },
              title: const Text(
                'Gluten Free',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: const Text(
                'Only includes glutten free foods',
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.only(left: 24, right: 32),
              activeColor: Colors.deepOrange,
            ),
            SwitchListTile(
              value: isLactoseFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  isLactoseFreeSet = isChecked;
                });
              },
              title: const Text(
                'Lactose Free',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: const Text(
                'Only includes lactose free foods',
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.only(left: 24, right: 32),
              activeColor: Colors.deepOrange,
            ),
            SwitchListTile(
              value: isVegterianSet,
              onChanged: (isChecked) {
                setState(() {
                  isVegterianSet = isChecked;
                });
              },
              title: const Text(
                'Vegeterian',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: const Text(
                'Only includes Vegeterian foods',
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.only(left: 24, right: 32),
              activeColor: Colors.deepOrange,
            ),
            SwitchListTile(
              value: isVeganSet,
              onChanged: (isChecked) {
                setState(() {
                  isVeganSet = isChecked;
                });
              },
              title: const Text(
                'Vegans',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: const Text(
                'Only includes vegan foods',
                style: TextStyle(color: Colors.white),
              ),
              contentPadding: const EdgeInsets.only(left: 24, right: 32),
              activeColor: Colors.deepOrange,
            ),
          ],
        ));
  }
}
