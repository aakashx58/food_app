import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters_screen.dart';

import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';


const kInitialfilter = {
  filter.glutenfree :false,
  filter.lactosefree:false,
  filter.vegeterian:false,
  filter.vegan:false,
};
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex =0;

  Map<filter,bool> _selectedFilters = kInitialfilter;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentfilters: _selectedFilters,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialfilter;
      });
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  final List<Meal> _favoriteMeals =[];
  void _toggleMealfavoriteStatus(Meal meal){
    final isExisting = _favoriteMeals.contains(meal);
    if(isExisting){
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favorite.');

    }else{
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Marked as favorite!');
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if(_selectedFilters[filter.glutenfree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[filter.lactosefree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[filter.vegeterian]! && !meal.isVegetarian){
        return false;
      }if(_selectedFilters[filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;


    }).toList();
    Widget activePage = CategoriesScreen(
      onTogglefavorite: _toggleMealfavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        title: '',
        meals: _favoriteMeals,
        onTogglefavorite: _toggleMealfavoriteStatus,
      );
      activePageTitle = 'Your favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
        ),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),

      ],),
    );
  }
}
