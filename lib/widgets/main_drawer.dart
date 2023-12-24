import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;




  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.brown,
                  Colors.orange,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Colors.greenAccent,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up!',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 28),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 28,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
                onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 28,
            ),
            title: const Text(
              'Filters',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
